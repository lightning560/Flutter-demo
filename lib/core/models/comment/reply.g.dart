// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reply.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reply _$$_ReplyFromJson(Map<String, dynamic> json) => _$_Reply(
      mid: json['mid'] as String,
      name: json['name'] as String,
      text: json['text'] as String,
      replyto: UserMini.fromJson(json['replyto'] as Map<String, dynamic>),
      likeCnt: json['like_cnt'] as int,
      createAt: json['create_at'] as int,
    );

Map<String, dynamic> _$$_ReplyToJson(_$_Reply instance) => <String, dynamic>{
      'mid': instance.mid,
      'name': instance.name,
      'text': instance.text,
      'replyto': instance.replyto,
      'like_cnt': instance.likeCnt,
      'create_at': instance.createAt,
    };
