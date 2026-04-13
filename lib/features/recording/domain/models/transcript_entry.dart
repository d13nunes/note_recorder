import 'package:freezed_annotation/freezed_annotation.dart';

part 'transcript_entry.freezed.dart';
part 'transcript_entry.g.dart';

@freezed
class TranscriptEntry with _$TranscriptEntry {
  const factory TranscriptEntry({
    required String speaker,
    required String text,
    required String timestamp,
  }) = _TranscriptEntry;

  factory TranscriptEntry.fromJson(Map<String, dynamic> json) =>
      _$TranscriptEntryFromJson(json);
}
