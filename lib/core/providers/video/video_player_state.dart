// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_player_state.freezed.dart';
part 'video_player_state.g.dart';

@freezed
class VideoPlayerState with _$VideoPlayerState {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory VideoPlayerState({
    required String id,
    required String poster,
    required String src,
    required bool muted,
    required String avatar,
    required String name,
    required int duration,
    required int position,
  }) = _VideoPlayerState;
  factory VideoPlayerState.fromJson(Map<String, Object?> json) =>
      _$VideoPlayerStateFromJson(json);
}
