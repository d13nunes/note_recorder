/// Concise formatting for [Duration] values.
extension DurationFormat on Duration {
  /// Returns e.g. "2m 15s" or "45s" when under a minute.
  String toShortString() {
    final m = inMinutes;
    final s = inSeconds % 60;
    if (m == 0) return '${s}s';
    return '${m}m ${s}s';
  }
}
