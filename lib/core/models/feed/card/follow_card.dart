// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../providers/feed/feed_kind_enum.dart';
part 'follow_card.freezed.dart';
part 'follow_card.g.dart';

@freezed
class FollowCard with _$FollowCard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FollowCard({
    required String id,
    required String cover,
    required String description,
    required String avatar,
    required String name,
    required List<String> imageList,
    required int likeCnt,
    required int favorCnt,
    required int replyCnt,
    required int createAt,
    required bool haveproduct,
    @JsonKey(unknownEnumValue: FeedKind.image) required FeedKind kind,
  }) = _FollowCard;
  factory FollowCard.fromJson(Map<String, Object?> json) =>
      _$FollowCardFromJson(json);
}
