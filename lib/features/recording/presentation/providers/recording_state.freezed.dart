// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecordingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingStateCopyWith<$Res> {
  factory $RecordingStateCopyWith(
    RecordingState value,
    $Res Function(RecordingState) then,
  ) = _$RecordingStateCopyWithImpl<$Res, RecordingState>;
}

/// @nodoc
class _$RecordingStateCopyWithImpl<$Res, $Val extends RecordingState>
    implements $RecordingStateCopyWith<$Res> {
  _$RecordingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IdleImplCopyWith<$Res> {
  factory _$$IdleImplCopyWith(
    _$IdleImpl value,
    $Res Function(_$IdleImpl) then,
  ) = __$$IdleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$IdleImpl>
    implements _$$IdleImplCopyWith<$Res> {
  __$$IdleImplCopyWithImpl(_$IdleImpl _value, $Res Function(_$IdleImpl) _then)
    : super(_value, _then);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$IdleImpl implements Idle {
  const _$IdleImpl();

  @override
  String toString() {
    return 'RecordingState.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements RecordingState {
  const factory Idle() = _$IdleImpl;
}

/// @nodoc
abstract class _$$RecordingImplCopyWith<$Res> {
  factory _$$RecordingImplCopyWith(
    _$RecordingImpl value,
    $Res Function(_$RecordingImpl) then,
  ) = __$$RecordingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration elapsed, String transcript});
}

/// @nodoc
class __$$RecordingImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$RecordingImpl>
    implements _$$RecordingImplCopyWith<$Res> {
  __$$RecordingImplCopyWithImpl(
    _$RecordingImpl _value,
    $Res Function(_$RecordingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? elapsed = null, Object? transcript = null}) {
    return _then(
      _$RecordingImpl(
        elapsed: null == elapsed
            ? _value.elapsed
            : elapsed // ignore: cast_nullable_to_non_nullable
                  as Duration,
        transcript: null == transcript
            ? _value.transcript
            : transcript // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RecordingImpl implements Recording {
  const _$RecordingImpl({required this.elapsed, this.transcript = ''});

  @override
  final Duration elapsed;
  @override
  @JsonKey()
  final String transcript;

  @override
  String toString() {
    return 'RecordingState.recording(elapsed: $elapsed, transcript: $transcript)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingImpl &&
            (identical(other.elapsed, elapsed) || other.elapsed == elapsed) &&
            (identical(other.transcript, transcript) ||
                other.transcript == transcript));
  }

  @override
  int get hashCode => Object.hash(runtimeType, elapsed, transcript);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      __$$RecordingImplCopyWithImpl<_$RecordingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) {
    return recording(elapsed, transcript);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) {
    return recording?.call(elapsed, transcript);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(elapsed, transcript);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) {
    return recording(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) {
    return recording?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (recording != null) {
      return recording(this);
    }
    return orElse();
  }
}

abstract class Recording implements RecordingState {
  const factory Recording({
    required final Duration elapsed,
    final String transcript,
  }) = _$RecordingImpl;

  Duration get elapsed;
  String get transcript;

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecordingImplCopyWith<_$RecordingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
    _$ProcessingImpl value,
    $Res Function(_$ProcessingImpl) then,
  ) = __$$ProcessingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProcessingStep step});
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
    _$ProcessingImpl _value,
    $Res Function(_$ProcessingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? step = null}) {
    return _then(
      _$ProcessingImpl(
        step: null == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as ProcessingStep,
      ),
    );
  }
}

/// @nodoc

class _$ProcessingImpl implements Processing {
  const _$ProcessingImpl({required this.step});

  @override
  final ProcessingStep step;

  @override
  String toString() {
    return 'RecordingState.processing(step: $step)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingImpl &&
            (identical(other.step, step) || other.step == step));
  }

  @override
  int get hashCode => Object.hash(runtimeType, step);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingImplCopyWith<_$ProcessingImpl> get copyWith =>
      __$$ProcessingImplCopyWithImpl<_$ProcessingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) {
    return processing(step);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) {
    return processing?.call(step);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(step);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class Processing implements RecordingState {
  const factory Processing({required final ProcessingStep step}) =
      _$ProcessingImpl;

  ProcessingStep get step;

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessingImplCopyWith<_$ProcessingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DoneImplCopyWith<$Res> {
  factory _$$DoneImplCopyWith(
    _$DoneImpl value,
    $Res Function(_$DoneImpl) then,
  ) = __$$DoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RecordingNote note});

  $RecordingNoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$DoneImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$DoneImpl>
    implements _$$DoneImplCopyWith<$Res> {
  __$$DoneImplCopyWithImpl(_$DoneImpl _value, $Res Function(_$DoneImpl) _then)
    : super(_value, _then);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? note = null}) {
    return _then(
      _$DoneImpl(
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as RecordingNote,
      ),
    );
  }

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordingNoteCopyWith<$Res> get note {
    return $RecordingNoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc

class _$DoneImpl implements Done {
  const _$DoneImpl({required this.note});

  @override
  final RecordingNote note;

  @override
  String toString() {
    return 'RecordingState.done(note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneImpl &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      __$$DoneImplCopyWithImpl<_$DoneImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) {
    return done(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) {
    return done?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) {
    return done(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) {
    return done?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (done != null) {
      return done(this);
    }
    return orElse();
  }
}

abstract class Done implements RecordingState {
  const factory Done({required final RecordingNote note}) = _$DoneImpl;

  RecordingNote get note;

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DoneImplCopyWith<_$DoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RecordingError error});

  $RecordingErrorCopyWith<$Res> get error;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RecordingStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$ErrorImpl(
        error: null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as RecordingError,
      ),
    );
  }

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecordingErrorCopyWith<$Res> get error {
    return $RecordingErrorCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

/// @nodoc

class _$ErrorImpl implements Error {
  const _$ErrorImpl({required this.error});

  @override
  final RecordingError error;

  @override
  String toString() {
    return 'RecordingState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(Duration elapsed, String transcript) recording,
    required TResult Function(ProcessingStep step) processing,
    required TResult Function(RecordingNote note) done,
    required TResult Function(RecordingError error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(Duration elapsed, String transcript)? recording,
    TResult? Function(ProcessingStep step)? processing,
    TResult? Function(RecordingNote note)? done,
    TResult? Function(RecordingError error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(Duration elapsed, String transcript)? recording,
    TResult Function(ProcessingStep step)? processing,
    TResult Function(RecordingNote note)? done,
    TResult Function(RecordingError error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Recording value) recording,
    required TResult Function(Processing value) processing,
    required TResult Function(Done value) done,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Recording value)? recording,
    TResult? Function(Processing value)? processing,
    TResult? Function(Done value)? done,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Recording value)? recording,
    TResult Function(Processing value)? processing,
    TResult Function(Done value)? done,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements RecordingState {
  const factory Error({required final RecordingError error}) = _$ErrorImpl;

  RecordingError get error;

  /// Create a copy of RecordingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
