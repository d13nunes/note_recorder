import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../interfaces/stt_repository.dart';

class STTRepositoryImpl implements STTRepository {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  bool _initialized = false;

  @override
  bool get isListening => _isListening;

  @override
  Future<void> startListening({
    required void Function(String text) onResult,
    required void Function(String error) onError,
  }) async {
    if (!_initialized) {
      _initialized = await _speech.initialize(
        onError: (error) => onError(error.errorMsg),
      );
    }

    if (!_initialized) {
      throw Exception('Microphone or speech recognition permission denied');
    }

    _isListening = true;
    await _speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
      listenOptions: stt.SpeechListenOptions(
        listenMode: stt.ListenMode.dictation,
        partialResults: true,
        onDevice: true,
      ),
    );
  }

  @override
  Future<void> stopListening() async {
    _isListening = false;
    await _speech.stop();
  }
}
