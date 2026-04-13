// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordingNoteImpl _$$RecordingNoteImplFromJson(Map<String, dynamic> json) =>
    _$RecordingNoteImpl(
      title: json['title'] as String,
      summary: json['summary'] as String,
      keyHighlights: (json['keyHighlights'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => ActionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: (json['transcript'] as List<dynamic>)
          .map((e) => TranscriptEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$$RecordingNoteImplToJson(_$RecordingNoteImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'keyHighlights': instance.keyHighlights,
      'actionItems': instance.actionItems,
      'transcript': instance.transcript,
      'createdAt': instance.createdAt.toIso8601String(),
      'duration': instance.duration.inMicroseconds,
    };
