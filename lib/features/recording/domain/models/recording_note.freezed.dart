// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecordingNote _$RecordingNoteFromJson(Map<String, dynamic> json) {
  return _RecordingNote.fromJson(json);
}

/// @nodoc
mixin _$RecordingNote {
  String get title => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  List<String> get keyHighlights => throw _privateConstructorUsedError;
  List<ActionItem> get actionItems => throw _privateConstructorUsedError;
  List<TranscriptEntry> get transcript => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  /// Serializes this RecordingNote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecordingNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecordingNoteCopyWith<RecordingNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingNoteCopyWith<$Res> {
  factory $RecordingNoteCopyWith(
    RecordingNote value,
    $Res Function(RecordingNote) then,
  ) = _$RecordingNoteCopyWithImpl<$Res, RecordingNote>;
  @useResult
  $Res call({
    String title,
    String summary,
    List<String> keyHighlights,
    List<ActionItem> actionItems,
    List<TranscriptEntry> transcript,
    DateTime createdAt,
    Duration duration,
  });
}

/// @nodoc
class _$RecordingNoteCopyWithImpl<$Res, $Val extends RecordingNote>
    implements $RecordingNoteCopyWith<$Res> {
  _$RecordingNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
    Object? keyHighlights = null,
    Object? actionItems = null,
    Object? transcript = null,
    Object? createdAt = null,
    Object? duration = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as String,
            keyHighlights: null == keyHighlights
                ? _value.keyHighlights
                : keyHighlights // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            actionItems: null == actionItems
                ? _value.actionItems
                : actionItems // ignore: cast_nullable_to_non_nullable
                      as List<ActionItem>,
            transcript: null == transcript
                ? _value.transcript
                : transcript // ignore: cast_nullable_to_non_nullable
                      as List<TranscriptEntry>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as Duration,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecordingNoteImplCopyWith<$Res>
    implements $RecordingNoteCopyWith<$Res> {
  factory _$$RecordingNoteImplCopyWith(
    _$RecordingNoteImpl value,
    $Res Function(_$RecordingNoteImpl) then,
  ) = __$$RecordingNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String summary,
    List<String> keyHighlights,
    List<ActionItem> actionItems,
    List<TranscriptEntry> transcript,
    DateTime createdAt,
    Duration duration,
  });
}

/// @nodoc
class __$$RecordingNoteImplCopyWithImpl<$Res>
    extends _$RecordingNoteCopyWithImpl<$Res, _$RecordingNoteImpl>
    implements _$$RecordingNoteImplCopyWith<$Res> {
  __$$RecordingNoteImplCopyWithImpl(
    _$RecordingNoteImpl _value,
    $Res Function(_$RecordingNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordingNote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? summary = null,
    Object? keyHighlights = null,
    Object? actionItems = null,
    Object? transcript = null,
    Object? createdAt = null,
    Object? duration = null,
  }) {
    return _then(
      _$RecordingNoteImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as String,
        keyHighlights: null == keyHighlights
            ? _value._keyHighlights
            : keyHighlights // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        actionItems: null == actionItems
            ? _value._actionItems
            : actionItems // ignore: cast_nullable_to_non_nullable
                  as List<ActionItem>,
        transcript: null == transcript
            ? _value._transcript
            : transcript // ignore: cast_nullable_to_non_nullable
                  as List<TranscriptEntry>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as Duration,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordingNoteImpl implements _RecordingNote {
  const _$RecordingNoteImpl({
    required this.title,
    required this.summary,
    required final List<String> keyHighlights,
    required final List<ActionItem> actionItems,
    required final List<TranscriptEntry> transcript,
    required this.createdAt,
    required this.duration,
  }) : _keyHighlights = keyHighlights,
       _actionItems = actionItems,
       _transcript = transcript;

  factory _$RecordingNoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordingNoteImplFromJson(json);

  @override
  final String title;
  @override
  final String summary;
  final List<String> _keyHighlights;
  @override
  List<String> get keyHighlights {
    if (_keyHighlights is EqualUnmodifiableListView) return _keyHighlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyHighlights);
  }

  final List<ActionItem> _actionItems;
  @override
  List<ActionItem> get actionItems {
    if (_actionItems is EqualUnmodifiableListView) return _actionItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionItems);
  }

  final List<TranscriptEntry> _transcript;
  @override
  List<TranscriptEntry> get transcript {
    if (_transcript is EqualUnmodifiableListView) return _transcript;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transcript);
  }

  @override
  final DateTime createdAt;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'RecordingNote(title: $title, summary: $summary, keyHighlights: $keyHighlights, actionItems: $actionItems, transcript: $transcript, createdAt: $createdAt, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingNoteImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(
              other._keyHighlights,
              _keyHighlights,
            ) &&
            const DeepCollectionEquality().equals(
              other._actionItems,
              _actionItems,
            ) &&
            const DeepCollectionEquality().equals(
              other._transcript,
              _transcript,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    summary,
    const DeepCollectionEquality().hash(_keyHighlights),
    const DeepCollectionEquality().hash(_actionItems),
    const DeepCollectionEquality().hash(_transcript),
    createdAt,
    duration,
  );

  /// Create a copy of RecordingNote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingNoteImplCopyWith<_$RecordingNoteImpl> get copyWith =>
      __$$RecordingNoteImplCopyWithImpl<_$RecordingNoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordingNoteImplToJson(this);
  }
}

abstract class _RecordingNote implements RecordingNote {
  const factory _RecordingNote({
    required final String title,
    required final String summary,
    required final List<String> keyHighlights,
    required final List<ActionItem> actionItems,
    required final List<TranscriptEntry> transcript,
    required final DateTime createdAt,
    required final Duration duration,
  }) = _$RecordingNoteImpl;

  factory _RecordingNote.fromJson(Map<String, dynamic> json) =
      _$RecordingNoteImpl.fromJson;

  @override
  String get title;
  @override
  String get summary;
  @override
  List<String> get keyHighlights;
  @override
  List<ActionItem> get actionItems;
  @override
  List<TranscriptEntry> get transcript;
  @override
  DateTime get createdAt;
  @override
  Duration get duration;

  /// Create a copy of RecordingNote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingNoteImplCopyWith<_$RecordingNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
