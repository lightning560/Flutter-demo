// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../providers/feed/feed_kind_enum.dart';

part 'feed_card.freezed.dart';
part 'feed_card.g.dart';

@freezed
class FeedCard with _$FeedCard {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FeedCard({
    required String? id,
    required String? cover,
    required String? avatar,
    required String? name,
    required String? title,
    required String topic,
    @JsonKey(unknownEnumValue: FeedKind.image) required FeedKind type,
    required int? likeCnt,
    // int? like_cnt,
    bool? haveProduct,
    bool? isSponsored,
    int? viewCnt,
  }) = _FeedCard;
  factory FeedCard.fromJson(Map<String, dynamic> json) =>
      _$FeedCardFromJson(json);
}
