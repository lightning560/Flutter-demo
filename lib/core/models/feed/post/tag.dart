import 'package:freezed_annotation/freezed_annotation.dart';
part 'tag.freezed.dart';
part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String id,
    required String name,
  }) = _Tab;
  factory Tag.fromJson(Map<String, Object?> json) => _$TagFromJson(json);
}
