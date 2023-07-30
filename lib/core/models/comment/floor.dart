import 'package:freezed_annotation/freezed_annotation.dart';

import 'reply.dart';
part 'floor.g.dart';
part 'floor.freezed.dart';

@freezed
class Floor with _$Floor {
  const factory Floor({
    required int replyCnt,
    required bool isHot,
    required bool isTop,
    required Reply root,
    required List<Reply> replys,
  }) = _Floor;
  factory Floor.fromJson(Map<String, Object?> json) => _$FloorFromJson(json);
}
