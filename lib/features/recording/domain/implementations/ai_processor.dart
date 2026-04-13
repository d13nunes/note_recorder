import '../models/recording_note.dart';
import '../interfaces/ai_processor_service.dart';

class AIProcessor {
  final AIProcessorService _aiRepository;

  AIProcessor(this._aiRepository);

  Future<RecordingNote> generateNote({
    required String transcript,
    required Duration duration,
  }) async {
    return _aiRepository.generateNote(
      transcript: transcript,
      duration: duration,
    );
  }
}
