// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_player_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VideoPlayerState _$$_VideoPlayerStateFromJson(Map<String, dynamic> json) =>
    _$_VideoPlayerState(
      id: json['id'] as String,
      poster: json['poster'] as String,
      src: json['src'] as String,
      muted: json['muted'] as bool,
      avatar: json['avatar'] as String,
      name: json['name'] as String,
      duration: json['duration'] as int,
      position: json['position'] as int,
    );

Map<String, dynamic> _$$_VideoPlayerStateToJson(_$_VideoPlayerState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster': instance.poster,
      'src': instance.src,
      'muted': instance.muted,
      'avatar': instance.avatar,
      'name': instance.name,
      'duration': instance.duration,
      'position': instance.position,
    };
