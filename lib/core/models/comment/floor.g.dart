// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Floor _$$_FloorFromJson(Map<String, dynamic> json) => _$_Floor(
      replyCnt: json['replyCnt'] as int,
      isHot: json['isHot'] as bool,
      isTop: json['isTop'] as bool,
      root: Reply.fromJson(json['root'] as Map<String, dynamic>),
      replys: (json['replys'] as List<dynamic>)
          .map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_FloorToJson(_$_Floor instance) => <String, dynamic>{
      'replyCnt': instance.replyCnt,
      'isHot': instance.isHot,
      'isTop': instance.isTop,
      'root': instance.root,
      'replys': instance.replys,
    };
