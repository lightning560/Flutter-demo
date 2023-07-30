// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedCard _$FeedCardFromJson(Map<String, dynamic> json) {
  return _FeedCard.fromJson(json);
}

/// @nodoc
mixin _$FeedCard {
  String? get id => throw _privateConstructorUsedError;
  String? get cover => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: FeedKind.image)
  FeedKind get type => throw _privateConstructorUsedError;
  int? get likeCnt => throw _privateConstructorUsedError; // int? like_cnt,
  bool? get haveProduct => throw _privateConstructorUsedError;
  bool? get isSponsored => throw _privateConstructorUsedError;
  int? get viewCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCardCopyWith<FeedCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCardCopyWith<$Res> {
  factory $FeedCardCopyWith(FeedCard value, $Res Function(FeedCard) then) =
      _$FeedCardCopyWithImpl<$Res, FeedCard>;
  @useResult
  $Res call(
      {String? id,
      String? cover,
      String? avatar,
      String? name,
      String? title,
      String topic,
      @JsonKey(unknownEnumValue: FeedKind.image) FeedKind type,
      int? likeCnt,
      bool? haveProduct,
      bool? isSponsored,
      int? viewCnt});
}

/// @nodoc
class _$FeedCardCopyWithImpl<$Res, $Val extends FeedCard>
    implements $FeedCardCopyWith<$Res> {
  _$FeedCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? topic = null,
    Object? type = null,
    Object? likeCnt = freezed,
    Object? haveProduct = freezed,
    Object? isSponsored = freezed,
    Object? viewCnt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedKind,
      likeCnt: freezed == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      haveProduct: freezed == haveProduct
          ? _value.haveProduct
          : haveProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSponsored: freezed == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedCardCopyWith<$Res> implements $FeedCardCopyWith<$Res> {
  factory _$$_FeedCardCopyWith(
          _$_FeedCard value, $Res Function(_$_FeedCard) then) =
      __$$_FeedCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? cover,
      String? avatar,
      String? name,
      String? title,
      String topic,
      @JsonKey(unknownEnumValue: FeedKind.image) FeedKind type,
      int? likeCnt,
      bool? haveProduct,
      bool? isSponsored,
      int? viewCnt});
}

/// @nodoc
class __$$_FeedCardCopyWithImpl<$Res>
    extends _$FeedCardCopyWithImpl<$Res, _$_FeedCard>
    implements _$$_FeedCardCopyWith<$Res> {
  __$$_FeedCardCopyWithImpl(
      _$_FeedCard _value, $Res Function(_$_FeedCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cover = freezed,
    Object? avatar = freezed,
    Object? name = freezed,
    Object? title = freezed,
    Object? topic = null,
    Object? type = null,
    Object? likeCnt = freezed,
    Object? haveProduct = freezed,
    Object? isSponsored = freezed,
    Object? viewCnt = freezed,
  }) {
    return _then(_$_FeedCard(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      cover: freezed == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedKind,
      likeCnt: freezed == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int?,
      haveProduct: freezed == haveProduct
          ? _value.haveProduct
          : haveProduct // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSponsored: freezed == isSponsored
          ? _value.isSponsored
          : isSponsored // ignore: cast_nullable_to_non_nullable
              as bool?,
      viewCnt: freezed == viewCnt
          ? _value.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_FeedCard implements _FeedCard {
  const _$_FeedCard(
      {required this.id,
      required this.cover,
      required this.avatar,
      required this.name,
      required this.title,
      required this.topic,
      @JsonKey(unknownEnumValue: FeedKind.image) required this.type,
      required this.likeCnt,
      this.haveProduct,
      this.isSponsored,
      this.viewCnt});

  factory _$_FeedCard.fromJson(Map<String, dynamic> json) =>
      _$$_FeedCardFromJson(json);

  @override
  final String? id;
  @override
  final String? cover;
  @override
  final String? avatar;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String topic;
  @override
  @JsonKey(unknownEnumValue: FeedKind.image)
  final FeedKind type;
  @override
  final int? likeCnt;
// int? like_cnt,
  @override
  final bool? haveProduct;
  @override
  final bool? isSponsored;
  @override
  final int? viewCnt;

  @override
  String toString() {
    return 'FeedCard(id: $id, cover: $cover, avatar: $avatar, name: $name, title: $title, topic: $topic, type: $type, likeCnt: $likeCnt, haveProduct: $haveProduct, isSponsored: $isSponsored, viewCnt: $viewCnt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.likeCnt, likeCnt) || other.likeCnt == likeCnt) &&
            (identical(other.haveProduct, haveProduct) ||
                other.haveProduct == haveProduct) &&
            (identical(other.isSponsored, isSponsored) ||
                other.isSponsored == isSponsored) &&
            (identical(other.viewCnt, viewCnt) || other.viewCnt == viewCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, cover, avatar, name, title,
      topic, type, likeCnt, haveProduct, isSponsored, viewCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedCardCopyWith<_$_FeedCard> get copyWith =>
      __$$_FeedCardCopyWithImpl<_$_FeedCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedCardToJson(
      this,
    );
  }
}

abstract class _FeedCard implements FeedCard {
  const factory _FeedCard(
      {required final String? id,
      required final String? cover,
      required final String? avatar,
      required final String? name,
      required final String? title,
      required final String topic,
      @JsonKey(unknownEnumValue: FeedKind.image) required final FeedKind type,
      required final int? likeCnt,
      final bool? haveProduct,
      final bool? isSponsored,
      final int? viewCnt}) = _$_FeedCard;

  factory _FeedCard.fromJson(Map<String, dynamic> json) = _$_FeedCard.fromJson;

  @override
  String? get id;
  @override
  String? get cover;
  @override
  String? get avatar;
  @override
  String? get name;
  @override
  String? get title;
  @override
  String get topic;
  @override
  @JsonKey(unknownEnumValue: FeedKind.image)
  FeedKind get type;
  @override
  int? get likeCnt;
  @override // int? like_cnt,
  bool? get haveProduct;
  @override
  bool? get isSponsored;
  @override
  int? get viewCnt;
  @override
  @JsonKey(ignore: true)
  _$$_FeedCardCopyWith<_$_FeedCard> get copyWith =>
      throw _privateConstructorUsedError;
}
