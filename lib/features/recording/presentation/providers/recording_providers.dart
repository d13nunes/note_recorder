import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/error/recording_error.dart';
import '../../../../core/services/adjust_service.dart';
import '../../domain/implementations/ai_processor.dart';
import '../../domain/implementations/gemini_repository_impl.dart';
import '../../domain/implementations/speech_to_text_processor.dart';
import '../../domain/implementations/stt_repository_impl.dart';
import 'recording_state.dart';

// Processor providers
final sttProcessorProvider = Provider<SpeechToTextProcessor>(
  (_) => SpeechToTextProcessor(STTRepositoryImpl()),
);

final aiProcessorProvider = Provider<AIProcessor>(
  (_) => AIProcessor(GeminiRepositoryImpl()),
);

// Main recording state notifier
final recordingProvider = NotifierProvider<RecordingNotifier, RecordingState>(
  RecordingNotifier.new,
);

class RecordingNotifier extends Notifier<RecordingState> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  String _lastTranscript = '';

  @override
  RecordingState build() => const RecordingState.idle();

  Future<void> startRecording() async {
    final stt = ref.read(sttProcessorProvider);

    try {
      var micStatus = await Permission.microphone.status;
      debugPrint('Microphone permission1: $micStatus');
      if (!micStatus.isGranted) {
        micStatus = await Permission.microphone.request();
      }
      debugPrint('Microphone permission2: $micStatus');
      if (!micStatus.isGranted) {
        state = const RecordingState.error(error: RecordingError.micDenied());
        return;
      }

      var speechStatus = await Permission.speech.status;
      if (!speechStatus.isGranted) {
        speechStatus = await Permission.speech.request();
      }
      if (!speechStatus.isGranted) {
        state = const RecordingState.error(
          error: RecordingError.speechToTextDenied(),
        );
        return;
      }

      await stt.startListening();

      _elapsed = Duration.zero;
      _startTimer();
      state = RecordingState.recording(elapsed: _elapsed);
    } catch (e) {
      debugPrint('Error starting recording: $e');
      state = RecordingState.error(
        error: RecordingError.sttFailed(message: e.toString()),
      );
    }
  }

  Future<void> stopRecording() async {
    _stopTimer();

    final stt = ref.read(sttProcessorProvider);
    final ai = ref.read(aiProcessorProvider);
    final duration = _elapsed;

    String transcript;
    try {
      transcript = await stt.stopListening();
    } catch (e) {
      debugPrint('Error stopping STT: $e');
      transcript = '';
    }
    AdjustService.trackRecordingComplete();

    if (transcript.isEmpty) {
      state = const RecordingState.error(
        error: RecordingError.sttFailed(
          message: 'No speech was detected. Please try again.',
        ),
      );
      return;
    }

    _lastTranscript = transcript;

    // Processing: transcription (already done via live STT — brief UX pause)
    state = const RecordingState.processing(step: ProcessingStep.transcribing);
    await Future.delayed(const Duration(milliseconds: 800));

    // Processing: AI summarisation
    state = const RecordingState.processing(step: ProcessingStep.summarising);

    try {
      final note = await ai
          .generateNote(transcript: transcript, duration: duration)
          .timeout(const Duration(seconds: 60));

      state = RecordingState.done(note: note);
    } on TimeoutException {
      state = const RecordingState.error(
        error: RecordingError.aiFailed(
          message: 'AI processing timed out. Please try again.',
        ),
      );
    } catch (e) {
      state = RecordingState.error(
        error: RecordingError.aiFailed(message: e.toString()),
      );
    }
  }

  Future<void> cancelRecording() async {
    _stopTimer();
    final stt = ref.read(sttProcessorProvider);
    await stt.stopListening();
    state = const RecordingState.idle();
  }

  void reset() {
    _stopTimer();
    _lastTranscript = '';
    ref.read(sttProcessorProvider).reset();
    state = const RecordingState.idle();
  }

  Future<void> retryAI() async {
    if (_lastTranscript.isEmpty) return;

    state = const RecordingState.processing(step: ProcessingStep.summarising);
    final ai = ref.read(aiProcessorProvider);
    try {
      final note = await ai.generateNote(
        transcript: _lastTranscript,
        duration: _elapsed,
      );
      state = RecordingState.done(note: note);
    } catch (e) {
      state = RecordingState.error(
        error: RecordingError.aiFailed(message: e.toString()),
      );
    }
  }

  void _startTimer() {
    final stt = ref.read(sttProcessorProvider);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _elapsed += const Duration(seconds: 1);
      state = RecordingState.recording(
        elapsed: _elapsed,
        transcript: stt.transcript,
      );
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
