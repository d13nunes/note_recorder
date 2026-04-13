// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transcript_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TranscriptEntry _$TranscriptEntryFromJson(Map<String, dynamic> json) {
  return _TranscriptEntry.fromJson(json);
}

/// @nodoc
mixin _$TranscriptEntry {
  String get speaker => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  /// Serializes this TranscriptEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TranscriptEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TranscriptEntryCopyWith<TranscriptEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TranscriptEntryCopyWith<$Res> {
  factory $TranscriptEntryCopyWith(
    TranscriptEntry value,
    $Res Function(TranscriptEntry) then,
  ) = _$TranscriptEntryCopyWithImpl<$Res, TranscriptEntry>;
  @useResult
  $Res call({String speaker, String text, String timestamp});
}

/// @nodoc
class _$TranscriptEntryCopyWithImpl<$Res, $Val extends TranscriptEntry>
    implements $TranscriptEntryCopyWith<$Res> {
  _$TranscriptEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TranscriptEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speaker = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(
      _value.copyWith(
            speaker: null == speaker
                ? _value.speaker
                : speaker // ignore: cast_nullable_to_non_nullable
                      as String,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TranscriptEntryImplCopyWith<$Res>
    implements $TranscriptEntryCopyWith<$Res> {
  factory _$$TranscriptEntryImplCopyWith(
    _$TranscriptEntryImpl value,
    $Res Function(_$TranscriptEntryImpl) then,
  ) = __$$TranscriptEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String speaker, String text, String timestamp});
}

/// @nodoc
class __$$TranscriptEntryImplCopyWithImpl<$Res>
    extends _$TranscriptEntryCopyWithImpl<$Res, _$TranscriptEntryImpl>
    implements _$$TranscriptEntryImplCopyWith<$Res> {
  __$$TranscriptEntryImplCopyWithImpl(
    _$TranscriptEntryImpl _value,
    $Res Function(_$TranscriptEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TranscriptEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speaker = null,
    Object? text = null,
    Object? timestamp = null,
  }) {
    return _then(
      _$TranscriptEntryImpl(
        speaker: null == speaker
            ? _value.speaker
            : speaker // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TranscriptEntryImpl implements _TranscriptEntry {
  const _$TranscriptEntryImpl({
    required this.speaker,
    required this.text,
    required this.timestamp,
  });

  factory _$TranscriptEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TranscriptEntryImplFromJson(json);

  @override
  final String speaker;
  @override
  final String text;
  @override
  final String timestamp;

  @override
  String toString() {
    return 'TranscriptEntry(speaker: $speaker, text: $text, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TranscriptEntryImpl &&
            (identical(other.speaker, speaker) || other.speaker == speaker) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, speaker, text, timestamp);

  /// Create a copy of TranscriptEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TranscriptEntryImplCopyWith<_$TranscriptEntryImpl> get copyWith =>
      __$$TranscriptEntryImplCopyWithImpl<_$TranscriptEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TranscriptEntryImplToJson(this);
  }
}

abstract class _TranscriptEntry implements TranscriptEntry {
  const factory _TranscriptEntry({
    required final String speaker,
    required final String text,
    required final String timestamp,
  }) = _$TranscriptEntryImpl;

  factory _TranscriptEntry.fromJson(Map<String, dynamic> json) =
      _$TranscriptEntryImpl.fromJson;

  @override
  String get speaker;
  @override
  String get text;
  @override
  String get timestamp;

  /// Create a copy of TranscriptEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TranscriptEntryImplCopyWith<_$TranscriptEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
