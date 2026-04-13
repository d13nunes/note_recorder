import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_item.freezed.dart';
part 'action_item.g.dart';

@freezed
class ActionItem with _$ActionItem {
  const factory ActionItem({
    required String text,
    @Default(false) bool isDone,
  }) = _ActionItem;

  factory ActionItem.fromJson(Map<String, dynamic> json) =>
      _$ActionItemFromJson(json);
}
