import 'package:freezed_annotation/freezed_annotation.dart';

import 'action_item.dart';
import 'transcript_entry.dart';

part 'recording_note.freezed.dart';
part 'recording_note.g.dart';

@freezed
class RecordingNote with _$RecordingNote {
  const factory RecordingNote({
    required String title,
    required String summary,
    required List<String> keyHighlights,
    required List<ActionItem> actionItems,
    required List<TranscriptEntry> transcript,
    required DateTime createdAt,
    required Duration duration,
  }) = _RecordingNote;

  factory RecordingNote.fromJson(Map<String, dynamic> json) =>
      _$RecordingNoteFromJson(json);

  /// Parses the JSON structure returned by AI providers (OpenAI / Gemini).
  static RecordingNote fromAIResponse(
    Map<String, dynamic> json,
    Duration duration,
  ) {
    return RecordingNote(
      title: json['title'] as String? ?? 'Untitled Recording',
      summary: json['summary'] as String? ?? '',
      keyHighlights: (json['keyHighlights'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      actionItems: (json['actionItems'] as List<dynamic>?)
              ?.map(
                (e) => ActionItem(
                  text: (e as Map<String, dynamic>)['text'] as String? ?? '',
                ),
              )
              .toList() ??
          [],
      transcript: (json['transcript'] as List<dynamic>?)
              ?.map((e) {
                final entry = e as Map<String, dynamic>;
                return TranscriptEntry(
                  speaker: entry['speaker'] as String? ?? 'Unknown',
                  text: entry['text'] as String? ?? '',
                  timestamp: entry['timestamp'] as String? ?? '0:00',
                );
              })
              .toList() ??
          [],
      createdAt: DateTime.now(),
      duration: duration,
    );
  }
}
