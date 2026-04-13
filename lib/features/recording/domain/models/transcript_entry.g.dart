// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transcript_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TranscriptEntryImpl _$$TranscriptEntryImplFromJson(
  Map<String, dynamic> json,
) => _$TranscriptEntryImpl(
  speaker: json['speaker'] as String,
  text: json['text'] as String,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$$TranscriptEntryImplToJson(
  _$TranscriptEntryImpl instance,
) => <String, dynamic>{
  'speaker': instance.speaker,
  'text': instance.text,
  'timestamp': instance.timestamp,
};
