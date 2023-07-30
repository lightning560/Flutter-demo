// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FollowCard _$$_FollowCardFromJson(Map<String, dynamic> json) =>
    _$_FollowCard(
      id: json['id'] as String,
      cover: json['cover'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      imageList: (json['image_list'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      likeCnt: json['like_cnt'] as int,
      favorCnt: json['favor_cnt'] as int,
      replyCnt: json['reply_cnt'] as int,
      createAt: json['create_at'] as int,
      haveproduct: json['haveproduct'] as bool,
      kind: $enumDecode(_$FeedKindEnumMap, json['kind'],
          unknownValue: FeedKind.image),
    );

Map<String, dynamic> _$$_FollowCardToJson(_$_FollowCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'description': instance.description,
      'avatar': instance.avatar,
      'name': instance.name,
      'image_list': instance.imageList,
      'like_cnt': instance.likeCnt,
      'favor_cnt': instance.favorCnt,
      'reply_cnt': instance.replyCnt,
      'create_at': instance.createAt,
      'haveproduct': instance.haveproduct,
      'kind': _$FeedKindEnumMap[instance.kind]!,
    };

const _$FeedKindEnumMap = {
  FeedKind.image: 'image',
  FeedKind.video: 'video',
  FeedKind.live: 'live',
};
