import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_mini.freezed.dart';
part 'user_mini.g.dart';

@freezed
class UserMini with _$UserMini {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserMini({
    required String id,
    required String name,
    required String avatar,
  }) = _UserMini;
  factory UserMini.fromJson(Map<String, dynamic> json) =>
      _$UserMiniFromJson(json);
}
