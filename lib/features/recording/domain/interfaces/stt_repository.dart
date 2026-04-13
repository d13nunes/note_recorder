abstract class STTRepository {
  Future<void> startListening({
    required void Function(String text) onResult,
    required void Function(String error) onError,
  });
  Future<void> stopListening();
  bool get isListening;
}
