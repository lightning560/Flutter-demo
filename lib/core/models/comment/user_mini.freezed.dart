// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_mini.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserMini _$UserMiniFromJson(Map<String, dynamic> json) {
  return _UserMini.fromJson(json);
}

/// @nodoc
mixin _$UserMini {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserMiniCopyWith<UserMini> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserMiniCopyWith<$Res> {
  factory $UserMiniCopyWith(UserMini value, $Res Function(UserMini) then) =
      _$UserMiniCopyWithImpl<$Res, UserMini>;
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class _$UserMiniCopyWithImpl<$Res, $Val extends UserMini>
    implements $UserMiniCopyWith<$Res> {
  _$UserMiniCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserMiniCopyWith<$Res> implements $UserMiniCopyWith<$Res> {
  factory _$$_UserMiniCopyWith(
          _$_UserMini value, $Res Function(_$_UserMini) then) =
      __$$_UserMiniCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String avatar});
}

/// @nodoc
class __$$_UserMiniCopyWithImpl<$Res>
    extends _$UserMiniCopyWithImpl<$Res, _$_UserMini>
    implements _$$_UserMiniCopyWith<$Res> {
  __$$_UserMiniCopyWithImpl(
      _$_UserMini _value, $Res Function(_$_UserMini) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatar = null,
  }) {
    return _then(_$_UserMini(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_UserMini implements _UserMini {
  const _$_UserMini(
      {required this.id, required this.name, required this.avatar});

  factory _$_UserMini.fromJson(Map<String, dynamic> json) =>
      _$$_UserMiniFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatar;

  @override
  String toString() {
    return 'UserMini(id: $id, name: $name, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserMini &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserMiniCopyWith<_$_UserMini> get copyWith =>
      __$$_UserMiniCopyWithImpl<_$_UserMini>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserMiniToJson(
      this,
    );
  }
}

abstract class _UserMini implements UserMini {
  const factory _UserMini(
      {required final String id,
      required final String name,
      required final String avatar}) = _$_UserMini;

  factory _UserMini.fromJson(Map<String, dynamic> json) = _$_UserMini.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get avatar;
  @override
  @JsonKey(ignore: true)
  _$$_UserMiniCopyWith<_$_UserMini> get copyWith =>
      throw _privateConstructorUsedError;
}
