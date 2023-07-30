// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoPost _$$_VideoPostFromJson(Map<String, dynamic> json) => _$_VideoPost(
      id: json['id'] as String,
      cover: json['cover'] as String,
      src: json['src'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      avatar: json['avatar'] as String,
      userName: json['user_name'] as String,
      createAt: json['create_at'] as int,
      updateAt: json['update_at'] as int,
      likeCnt: json['like_cnt'] as int,
      favorCnt: json['favor_cnt'] as int,
      replayCnt: json['replay_cnt'] as int,
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLike: json['is_like'] as bool,
      isFavor: json['is_favor'] as bool,
      isFollow: json['is_follow'] as bool,
      inspirationId: json['inspiration_id'] as String,
      inspirationName: json['inspiration_name'] as String,
      kind: $enumDecode(_$FeedKindEnumMap, json['kind'],
          unknownValue: FeedKind.video),
    );

Map<String, dynamic> _$$_VideoPostToJson(_$_VideoPost instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'src': instance.src,
      'title': instance.title,
      'description': instance.description,
      'avatar': instance.avatar,
      'user_name': instance.userName,
      'create_at': instance.createAt,
      'update_at': instance.updateAt,
      'like_cnt': instance.likeCnt,
      'favor_cnt': instance.favorCnt,
      'replay_cnt': instance.replayCnt,
      'tags': instance.tags,
      'is_like': instance.isLike,
      'is_favor': instance.isFavor,
      'is_follow': instance.isFollow,
      'inspiration_id': instance.inspirationId,
      'inspiration_name': instance.inspirationName,
      'kind': _$FeedKindEnumMap[instance.kind]!,
    };

const _$FeedKindEnumMap = {
  FeedKind.image: 'image',
  FeedKind.video: 'video',
  FeedKind.live: 'live',
};
