// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ActionItem _$ActionItemFromJson(Map<String, dynamic> json) {
  return _ActionItem.fromJson(json);
}

/// @nodoc
mixin _$ActionItem {
  String get text => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  /// Serializes this ActionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActionItemCopyWith<ActionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionItemCopyWith<$Res> {
  factory $ActionItemCopyWith(
    ActionItem value,
    $Res Function(ActionItem) then,
  ) = _$ActionItemCopyWithImpl<$Res, ActionItem>;
  @useResult
  $Res call({String text, bool isDone});
}

/// @nodoc
class _$ActionItemCopyWithImpl<$Res, $Val extends ActionItem>
    implements $ActionItemCopyWith<$Res> {
  _$ActionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? isDone = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            isDone: null == isDone
                ? _value.isDone
                : isDone // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ActionItemImplCopyWith<$Res>
    implements $ActionItemCopyWith<$Res> {
  factory _$$ActionItemImplCopyWith(
    _$ActionItemImpl value,
    $Res Function(_$ActionItemImpl) then,
  ) = __$$ActionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool isDone});
}

/// @nodoc
class __$$ActionItemImplCopyWithImpl<$Res>
    extends _$ActionItemCopyWithImpl<$Res, _$ActionItemImpl>
    implements _$$ActionItemImplCopyWith<$Res> {
  __$$ActionItemImplCopyWithImpl(
    _$ActionItemImpl _value,
    $Res Function(_$ActionItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? isDone = null}) {
    return _then(
      _$ActionItemImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        isDone: null == isDone
            ? _value.isDone
            : isDone // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActionItemImpl implements _ActionItem {
  const _$ActionItemImpl({required this.text, this.isDone = false});

  factory _$ActionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActionItemImplFromJson(json);

  @override
  final String text;
  @override
  @JsonKey()
  final bool isDone;

  @override
  String toString() {
    return 'ActionItem(text: $text, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActionItemImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, isDone);

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActionItemImplCopyWith<_$ActionItemImpl> get copyWith =>
      __$$ActionItemImplCopyWithImpl<_$ActionItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActionItemImplToJson(this);
  }
}

abstract class _ActionItem implements ActionItem {
  const factory _ActionItem({required final String text, final bool isDone}) =
      _$ActionItemImpl;

  factory _ActionItem.fromJson(Map<String, dynamic> json) =
      _$ActionItemImpl.fromJson;

  @override
  String get text;
  @override
  bool get isDone;

  /// Create a copy of ActionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActionItemImplCopyWith<_$ActionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
