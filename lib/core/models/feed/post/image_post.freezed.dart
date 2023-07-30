// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImagePost _$ImagePostFromJson(Map<String, dynamic> json) {
  return _ImagePost.fromJson(json);
}

/// @nodoc
mixin _$ImagePost {
  String get id => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  List<String> get imageList => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  int get createAt => throw _privateConstructorUsedError;
  int get updateAt => throw _privateConstructorUsedError;
  int get likeCnt => throw _privateConstructorUsedError;
  int get favorCnt => throw _privateConstructorUsedError;
  int get replayCnt => throw _privateConstructorUsedError;
  int get shareCnt => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  bool get isLike => throw _privateConstructorUsedError;
  bool get isFavor => throw _privateConstructorUsedError;
  bool get isFollow => throw _privateConstructorUsedError;
  String get inspirationId => throw _privateConstructorUsedError;
  String get inspirationName => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: FeedKind.image)
  FeedKind get kind => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImagePostCopyWith<ImagePost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagePostCopyWith<$Res> {
  factory $ImagePostCopyWith(ImagePost value, $Res Function(ImagePost) then) =
      _$ImagePostCopyWithImpl<$Res, ImagePost>;
  @useResult
  $Res call(
      {String id,
      String cover,
      List<String> imageList,
      String title,
      String description,
      String avatar,
      String userName,
      int createAt,
      int updateAt,
      int likeCnt,
      int favorCnt,
      int replayCnt,
      int shareCnt,
      List<Tag> tags,
      bool isLike,
      bool isFavor,
      bool isFollow,
      String inspirationId,
      String inspirationName,
      @JsonKey(unknownEnumValue: FeedKind.image) FeedKind kind});
}

/// @nodoc
class _$ImagePostCopyWithImpl<$Res, $Val extends ImagePost>
    implements $ImagePostCopyWith<$Res> {
  _$ImagePostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cover = null,
    Object? imageList = null,
    Object? title = null,
    Object? description = null,
    Object? avatar = null,
    Object? userName = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? likeCnt = null,
    Object? favorCnt = null,
    Object? replayCnt = null,
    Object? shareCnt = null,
    Object? tags = null,
    Object? isLike = null,
    Object? isFavor = null,
    Object? isFollow = null,
    Object? inspirationId = null,
    Object? inspirationName = null,
    Object? kind = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      imageList: null == imageList
          ? _value.imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as int,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      favorCnt: null == favorCnt
          ? _value.favorCnt
          : favorCnt // ignore: cast_nullable_to_non_nullable
              as int,
      replayCnt: null == replayCnt
          ? _value.replayCnt
          : replayCnt // ignore: cast_nullable_to_non_nullable
              as int,
      shareCnt: null == shareCnt
          ? _value.shareCnt
          : shareCnt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavor: null == isFavor
          ? _value.isFavor
          : isFavor // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      inspirationId: null == inspirationId
          ? _value.inspirationId
          : inspirationId // ignore: cast_nullable_to_non_nullable
              as String,
      inspirationName: null == inspirationName
          ? _value.inspirationName
          : inspirationName // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as FeedKind,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImagePostCopyWith<$Res> implements $ImagePostCopyWith<$Res> {
  factory _$$_ImagePostCopyWith(
          _$_ImagePost value, $Res Function(_$_ImagePost) then) =
      __$$_ImagePostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String cover,
      List<String> imageList,
      String title,
      String description,
      String avatar,
      String userName,
      int createAt,
      int updateAt,
      int likeCnt,
      int favorCnt,
      int replayCnt,
      int shareCnt,
      List<Tag> tags,
      bool isLike,
      bool isFavor,
      bool isFollow,
      String inspirationId,
      String inspirationName,
      @JsonKey(unknownEnumValue: FeedKind.image) FeedKind kind});
}

/// @nodoc
class __$$_ImagePostCopyWithImpl<$Res>
    extends _$ImagePostCopyWithImpl<$Res, _$_ImagePost>
    implements _$$_ImagePostCopyWith<$Res> {
  __$$_ImagePostCopyWithImpl(
      _$_ImagePost _value, $Res Function(_$_ImagePost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cover = null,
    Object? imageList = null,
    Object? title = null,
    Object? description = null,
    Object? avatar = null,
    Object? userName = null,
    Object? createAt = null,
    Object? updateAt = null,
    Object? likeCnt = null,
    Object? favorCnt = null,
    Object? replayCnt = null,
    Object? shareCnt = null,
    Object? tags = null,
    Object? isLike = null,
    Object? isFavor = null,
    Object? isFollow = null,
    Object? inspirationId = null,
    Object? inspirationName = null,
    Object? kind = null,
  }) {
    return _then(_$_ImagePost(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      imageList: null == imageList
          ? _value._imageList
          : imageList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as int,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as int,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      favorCnt: null == favorCnt
          ? _value.favorCnt
          : favorCnt // ignore: cast_nullable_to_non_nullable
              as int,
      replayCnt: null == replayCnt
          ? _value.replayCnt
          : replayCnt // ignore: cast_nullable_to_non_nullable
              as int,
      shareCnt: null == shareCnt
          ? _value.shareCnt
          : shareCnt // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      isLike: null == isLike
          ? _value.isLike
          : isLike // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavor: null == isFavor
          ? _value.isFavor
          : isFavor // ignore: cast_nullable_to_non_nullable
              as bool,
      isFollow: null == isFollow
          ? _value.isFollow
          : isFollow // ignore: cast_nullable_to_non_nullable
              as bool,
      inspirationId: null == inspirationId
          ? _value.inspirationId
          : inspirationId // ignore: cast_nullable_to_non_nullable
              as String,
      inspirationName: null == inspirationName
          ? _value.inspirationName
          : inspirationName // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as FeedKind,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ImagePost implements _ImagePost {
  const _$_ImagePost(
      {required this.id,
      required this.cover,
      required final List<String> imageList,
      required this.title,
      required this.description,
      required this.avatar,
      required this.userName,
      required this.createAt,
      required this.updateAt,
      required this.likeCnt,
      required this.favorCnt,
      required this.replayCnt,
      required this.shareCnt,
      required final List<Tag> tags,
      required this.isLike,
      required this.isFavor,
      required this.isFollow,
      required this.inspirationId,
      required this.inspirationName,
      @JsonKey(unknownEnumValue: FeedKind.image) required this.kind})
      : _imageList = imageList,
        _tags = tags;

  factory _$_ImagePost.fromJson(Map<String, dynamic> json) =>
      _$$_ImagePostFromJson(json);

  @override
  final String id;
  @override
  final String cover;
  final List<String> _imageList;
  @override
  List<String> get imageList {
    if (_imageList is EqualUnmodifiableListView) return _imageList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageList);
  }

  @override
  final String title;
  @override
  final String description;
  @override
  final String avatar;
  @override
  final String userName;
  @override
  final int createAt;
  @override
  final int updateAt;
  @override
  final int likeCnt;
  @override
  final int favorCnt;
  @override
  final int replayCnt;
  @override
  final int shareCnt;
  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final bool isLike;
  @override
  final bool isFavor;
  @override
  final bool isFollow;
  @override
  final String inspirationId;
  @override
  final String inspirationName;
  @override
  @JsonKey(unknownEnumValue: FeedKind.image)
  final FeedKind kind;

  @override
  String toString() {
    return 'ImagePost(id: $id, cover: $cover, imageList: $imageList, title: $title, description: $description, avatar: $avatar, userName: $userName, createAt: $createAt, updateAt: $updateAt, likeCnt: $likeCnt, favorCnt: $favorCnt, replayCnt: $replayCnt, shareCnt: $shareCnt, tags: $tags, isLike: $isLike, isFavor: $isFavor, isFollow: $isFollow, inspirationId: $inspirationId, inspirationName: $inspirationName, kind: $kind)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ImagePost &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            const DeepCollectionEquality()
                .equals(other._imageList, _imageList) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.likeCnt, likeCnt) || other.likeCnt == likeCnt) &&
            (identical(other.favorCnt, favorCnt) ||
                other.favorCnt == favorCnt) &&
            (identical(other.replayCnt, replayCnt) ||
                other.replayCnt == replayCnt) &&
            (identical(other.shareCnt, shareCnt) ||
                other.shareCnt == shareCnt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isLike, isLike) || other.isLike == isLike) &&
            (identical(other.isFavor, isFavor) || other.isFavor == isFavor) &&
            (identical(other.isFollow, isFollow) ||
                other.isFollow == isFollow) &&
            (identical(other.inspirationId, inspirationId) ||
                other.inspirationId == inspirationId) &&
            (identical(other.inspirationName, inspirationName) ||
                other.inspirationName == inspirationName) &&
            (identical(other.kind, kind) || other.kind == kind));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        cover,
        const DeepCollectionEquality().hash(_imageList),
        title,
        description,
        avatar,
        userName,
        createAt,
        updateAt,
        likeCnt,
        favorCnt,
        replayCnt,
        shareCnt,
        const DeepCollectionEquality().hash(_tags),
        isLike,
        isFavor,
        isFollow,
        inspirationId,
        inspirationName,
        kind
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImagePostCopyWith<_$_ImagePost> get copyWith =>
      __$$_ImagePostCopyWithImpl<_$_ImagePost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImagePostToJson(
      this,
    );
  }
}

abstract class _ImagePost implements ImagePost {
  const factory _ImagePost(
      {required final String id,
      required final String cover,
      required final List<String> imageList,
      required final String title,
      required final String description,
      required final String avatar,
      required final String userName,
      required final int createAt,
      required final int updateAt,
      required final int likeCnt,
      required final int favorCnt,
      required final int replayCnt,
      required final int shareCnt,
      required final List<Tag> tags,
      required final bool isLike,
      required final bool isFavor,
      required final bool isFollow,
      required final String inspirationId,
      required final String inspirationName,
      @JsonKey(unknownEnumValue: FeedKind.image)
          required final FeedKind kind}) = _$_ImagePost;

  factory _ImagePost.fromJson(Map<String, dynamic> json) =
      _$_ImagePost.fromJson;

  @override
  String get id;
  @override
  String get cover;
  @override
  List<String> get imageList;
  @override
  String get title;
  @override
  String get description;
  @override
  String get avatar;
  @override
  String get userName;
  @override
  int get createAt;
  @override
  int get updateAt;
  @override
  int get likeCnt;
  @override
  int get favorCnt;
  @override
  int get replayCnt;
  @override
  int get shareCnt;
  @override
  List<Tag> get tags;
  @override
  bool get isLike;
  @override
  bool get isFavor;
  @override
  bool get isFollow;
  @override
  String get inspirationId;
  @override
  String get inspirationName;
  @override
  @JsonKey(unknownEnumValue: FeedKind.image)
  FeedKind get kind;
  @override
  @JsonKey(ignore: true)
  _$$_ImagePostCopyWith<_$_ImagePost> get copyWith =>
      throw _privateConstructorUsedError;
}
