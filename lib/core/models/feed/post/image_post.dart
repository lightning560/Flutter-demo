// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../providers/feed/feed_kind_enum.dart';
import 'tag.dart';
part 'image_post.freezed.dart';
part 'image_post.g.dart';

@freezed
class ImagePost with _$ImagePost {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ImagePost({
    required String id,
    required String cover,
    required List<String> imageList,
    required String title,
    required String description,
    required String avatar,
    required String userName,
    required int createAt,
    required int updateAt,
    required int likeCnt,
    required int favorCnt,
    required int replayCnt,
    required int shareCnt,
    required List<Tag> tags,
    required bool isLike,
    required bool isFavor,
    required bool isFollow,
    required String inspirationId,
    required String inspirationName,
    @JsonKey(unknownEnumValue: FeedKind.image) required FeedKind kind,
  }) = _ImagePost;
  factory ImagePost.fromJson(Map<String, Object?> json) =>
      _$ImagePostFromJson(json);
}
