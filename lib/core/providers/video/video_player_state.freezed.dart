// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VideoPlayerState _$VideoPlayerStateFromJson(Map<String, dynamic> json) {
  return _VideoPlayerState.fromJson(json);
}

/// @nodoc
mixin _$VideoPlayerState {
  String get id => throw _privateConstructorUsedError;
  String get poster => throw _privateConstructorUsedError;
  String get src => throw _privateConstructorUsedError;
  bool get muted => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VideoPlayerStateCopyWith<VideoPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoPlayerStateCopyWith<$Res> {
  factory $VideoPlayerStateCopyWith(
          VideoPlayerState value, $Res Function(VideoPlayerState) then) =
      _$VideoPlayerStateCopyWithImpl<$Res, VideoPlayerState>;
  @useResult
  $Res call(
      {String id,
      String poster,
      String src,
      bool muted,
      String avatar,
      String name,
      int duration,
      int position});
}

/// @nodoc
class _$VideoPlayerStateCopyWithImpl<$Res, $Val extends VideoPlayerState>
    implements $VideoPlayerStateCopyWith<$Res> {
  _$VideoPlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poster = null,
    Object? src = null,
    Object? muted = null,
    Object? avatar = null,
    Object? name = null,
    Object? duration = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VideoPlayerStateCopyWith<$Res>
    implements $VideoPlayerStateCopyWith<$Res> {
  factory _$$_VideoPlayerStateCopyWith(
          _$_VideoPlayerState value, $Res Function(_$_VideoPlayerState) then) =
      __$$_VideoPlayerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String poster,
      String src,
      bool muted,
      String avatar,
      String name,
      int duration,
      int position});
}

/// @nodoc
class __$$_VideoPlayerStateCopyWithImpl<$Res>
    extends _$VideoPlayerStateCopyWithImpl<$Res, _$_VideoPlayerState>
    implements _$$_VideoPlayerStateCopyWith<$Res> {
  __$$_VideoPlayerStateCopyWithImpl(
      _$_VideoPlayerState _value, $Res Function(_$_VideoPlayerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poster = null,
    Object? src = null,
    Object? muted = null,
    Object? avatar = null,
    Object? name = null,
    Object? duration = null,
    Object? position = null,
  }) {
    return _then(_$_VideoPlayerState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poster: null == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_VideoPlayerState implements _VideoPlayerState {
  const _$_VideoPlayerState(
      {required this.id,
      required this.poster,
      required this.src,
      required this.muted,
      required this.avatar,
      required this.name,
      required this.duration,
      required this.position});

  factory _$_VideoPlayerState.fromJson(Map<String, dynamic> json) =>
      _$$_VideoPlayerStateFromJson(json);

  @override
  final String id;
  @override
  final String poster;
  @override
  final String src;
  @override
  final bool muted;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final int duration;
  @override
  final int position;

  @override
  String toString() {
    return 'VideoPlayerState(id: $id, poster: $poster, src: $src, muted: $muted, avatar: $avatar, name: $name, duration: $duration, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VideoPlayerState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poster, poster) || other.poster == poster) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, poster, src, muted, avatar, name, duration, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VideoPlayerStateCopyWith<_$_VideoPlayerState> get copyWith =>
      __$$_VideoPlayerStateCopyWithImpl<_$_VideoPlayerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VideoPlayerStateToJson(
      this,
    );
  }
}

abstract class _VideoPlayerState implements VideoPlayerState {
  const factory _VideoPlayerState(
      {required final String id,
      required final String poster,
      required final String src,
      required final bool muted,
      required final String avatar,
      required final String name,
      required final int duration,
      required final int position}) = _$_VideoPlayerState;

  factory _VideoPlayerState.fromJson(Map<String, dynamic> json) =
      _$_VideoPlayerState.fromJson;

  @override
  String get id;
  @override
  String get poster;
  @override
  String get src;
  @override
  bool get muted;
  @override
  String get avatar;
  @override
  String get name;
  @override
  int get duration;
  @override
  int get position;
  @override
  @JsonKey(ignore: true)
  _$$_VideoPlayerStateCopyWith<_$_VideoPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
