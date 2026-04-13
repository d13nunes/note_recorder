import '../models/recording_note.dart';

abstract class AIProcessorService {
  Future<RecordingNote> generateNote({
    required String transcript,
    required Duration duration,
  });
}
