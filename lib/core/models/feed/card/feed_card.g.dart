// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FeedCard _$$_FeedCardFromJson(Map<String, dynamic> json) => _$_FeedCard(
      id: json['id'] as String?,
      cover: json['cover'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      topic: json['topic'] as String,
      type: $enumDecode(_$FeedKindEnumMap, json['type'],
          unknownValue: FeedKind.image),
      likeCnt: json['like_cnt'] as int?,
      haveProduct: json['have_product'] as bool?,
      isSponsored: json['is_sponsored'] as bool?,
      viewCnt: json['view_cnt'] as int?,
    );

Map<String, dynamic> _$$_FeedCardToJson(_$_FeedCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'avatar': instance.avatar,
      'name': instance.name,
      'title': instance.title,
      'topic': instance.topic,
      'type': _$FeedKindEnumMap[instance.type]!,
      'like_cnt': instance.likeCnt,
      'have_product': instance.haveProduct,
      'is_sponsored': instance.isSponsored,
      'view_cnt': instance.viewCnt,
    };

const _$FeedKindEnumMap = {
  FeedKind.image: 'image',
  FeedKind.video: 'video',
  FeedKind.live: 'live',
};
