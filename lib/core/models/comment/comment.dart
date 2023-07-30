import 'package:freezed_annotation/freezed_annotation.dart';

import 'floor.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String authorId,
    required int replyCnt,
    required List<Floor> floors,
  }) = _Comment;
  factory Comment.fromJson(Map<String, Object?> json) =>
      _$CommentFromJson(json);
}
