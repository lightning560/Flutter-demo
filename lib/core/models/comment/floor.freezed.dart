// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'floor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Floor _$FloorFromJson(Map<String, dynamic> json) {
  return _Floor.fromJson(json);
}

/// @nodoc
mixin _$Floor {
  int get replyCnt => throw _privateConstructorUsedError;
  bool get isHot => throw _privateConstructorUsedError;
  bool get isTop => throw _privateConstructorUsedError;
  Reply get root => throw _privateConstructorUsedError;
  List<Reply> get replys => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FloorCopyWith<Floor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FloorCopyWith<$Res> {
  factory $FloorCopyWith(Floor value, $Res Function(Floor) then) =
      _$FloorCopyWithImpl<$Res, Floor>;
  @useResult
  $Res call(
      {int replyCnt, bool isHot, bool isTop, Reply root, List<Reply> replys});

  $ReplyCopyWith<$Res> get root;
}

/// @nodoc
class _$FloorCopyWithImpl<$Res, $Val extends Floor>
    implements $FloorCopyWith<$Res> {
  _$FloorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyCnt = null,
    Object? isHot = null,
    Object? isTop = null,
    Object? root = null,
    Object? replys = null,
  }) {
    return _then(_value.copyWith(
      replyCnt: null == replyCnt
          ? _value.replyCnt
          : replyCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHot: null == isHot
          ? _value.isHot
          : isHot // ignore: cast_nullable_to_non_nullable
              as bool,
      isTop: null == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool,
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as Reply,
      replys: null == replys
          ? _value.replys
          : replys // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReplyCopyWith<$Res> get root {
    return $ReplyCopyWith<$Res>(_value.root, (value) {
      return _then(_value.copyWith(root: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FloorCopyWith<$Res> implements $FloorCopyWith<$Res> {
  factory _$$_FloorCopyWith(_$_Floor value, $Res Function(_$_Floor) then) =
      __$$_FloorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int replyCnt, bool isHot, bool isTop, Reply root, List<Reply> replys});

  @override
  $ReplyCopyWith<$Res> get root;
}

/// @nodoc
class __$$_FloorCopyWithImpl<$Res> extends _$FloorCopyWithImpl<$Res, _$_Floor>
    implements _$$_FloorCopyWith<$Res> {
  __$$_FloorCopyWithImpl(_$_Floor _value, $Res Function(_$_Floor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? replyCnt = null,
    Object? isHot = null,
    Object? isTop = null,
    Object? root = null,
    Object? replys = null,
  }) {
    return _then(_$_Floor(
      replyCnt: null == replyCnt
          ? _value.replyCnt
          : replyCnt // ignore: cast_nullable_to_non_nullable
              as int,
      isHot: null == isHot
          ? _value.isHot
          : isHot // ignore: cast_nullable_to_non_nullable
              as bool,
      isTop: null == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool,
      root: null == root
          ? _value.root
          : root // ignore: cast_nullable_to_non_nullable
              as Reply,
      replys: null == replys
          ? _value._replys
          : replys // ignore: cast_nullable_to_non_nullable
              as List<Reply>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Floor implements _Floor {
  const _$_Floor(
      {required this.replyCnt,
      required this.isHot,
      required this.isTop,
      required this.root,
      required final List<Reply> replys})
      : _replys = replys;

  factory _$_Floor.fromJson(Map<String, dynamic> json) =>
      _$$_FloorFromJson(json);

  @override
  final int replyCnt;
  @override
  final bool isHot;
  @override
  final bool isTop;
  @override
  final Reply root;
  final List<Reply> _replys;
  @override
  List<Reply> get replys {
    if (_replys is EqualUnmodifiableListView) return _replys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replys);
  }

  @override
  String toString() {
    return 'Floor(replyCnt: $replyCnt, isHot: $isHot, isTop: $isTop, root: $root, replys: $replys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Floor &&
            (identical(other.replyCnt, replyCnt) ||
                other.replyCnt == replyCnt) &&
            (identical(other.isHot, isHot) || other.isHot == isHot) &&
            (identical(other.isTop, isTop) || other.isTop == isTop) &&
            (identical(other.root, root) || other.root == root) &&
            const DeepCollectionEquality().equals(other._replys, _replys));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, replyCnt, isHot, isTop, root,
      const DeepCollectionEquality().hash(_replys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FloorCopyWith<_$_Floor> get copyWith =>
      __$$_FloorCopyWithImpl<_$_Floor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FloorToJson(
      this,
    );
  }
}

abstract class _Floor implements Floor {
  const factory _Floor(
      {required final int replyCnt,
      required final bool isHot,
      required final bool isTop,
      required final Reply root,
      required final List<Reply> replys}) = _$_Floor;

  factory _Floor.fromJson(Map<String, dynamic> json) = _$_Floor.fromJson;

  @override
  int get replyCnt;
  @override
  bool get isHot;
  @override
  bool get isTop;
  @override
  Reply get root;
  @override
  List<Reply> get replys;
  @override
  @JsonKey(ignore: true)
  _$$_FloorCopyWith<_$_Floor> get copyWith =>
      throw _privateConstructorUsedError;
}
