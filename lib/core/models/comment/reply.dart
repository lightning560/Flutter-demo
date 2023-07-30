import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_mini.dart';

part 'reply.freezed.dart';
part 'reply.g.dart';

@freezed
class Reply with _$Reply {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Reply({
    required String mid,
    required String name,
    required String text,
    required UserMini replyto,
    required int likeCnt,
    required int createAt,
  }) = _Reply;
  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}
