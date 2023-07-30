// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'tag.dart';
import '../../../providers/feed/feed_kind_enum.dart';
part 'video_post.freezed.dart';
part 'video_post.g.dart';

@freezed
class VideoPost with _$VideoPost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VideoPost({
    required String id,
    required String cover,
    required String src,
    required String title,
    required String description,
    required String avatar,
    required String userName,
    required int createAt,
    required int updateAt,
    required int likeCnt,
    required int favorCnt,
    required int replayCnt,
    required List<Tag> tags,
    required bool isLike,
    required bool isFavor,
    required bool isFollow,
    required String inspirationId,
    required String inspirationName,
    @JsonKey(unknownEnumValue: FeedKind.video) required FeedKind kind,
  }) = _VideoPost;
  factory VideoPost.fromJson(Map<String, Object?> json) =>
      _$VideoPostFromJson(json);
}
