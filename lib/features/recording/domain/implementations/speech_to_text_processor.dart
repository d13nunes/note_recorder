import '../interfaces/stt_repository.dart';

class SpeechToTextProcessor {
  final STTRepository _sttRepository;
  String _accumulatedTranscript = '';
  String? _lastError;

  SpeechToTextProcessor(this._sttRepository);

  String get transcript => _accumulatedTranscript;
  String? get lastError => _lastError;

  Future<void> startListening() async {
    _accumulatedTranscript = '';
    _lastError = null;

    await _sttRepository.startListening(
      onResult: (text) {
        _accumulatedTranscript = text;
      },
      onError: (error) {
        _lastError = error;
      },
    );
  }

  Future<String> stopListening() async {
    await _sttRepository.stopListening();
    return _accumulatedTranscript;
  }

  void reset() {
    _accumulatedTranscript = '';
    _lastError = null;
  }
}
