// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  TaskUserModel get user => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String status,
      String type,
      TaskUserModel user,
      int createdAt,
      String date});

  $TaskUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? type = null,
    Object? user = null,
    Object? createdAt = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TaskUserModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskUserModelCopyWith<$Res> get user {
    return $TaskUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String status,
      String type,
      TaskUserModel user,
      int createdAt,
      String date});

  @override
  $TaskUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? status = null,
    Object? type = null,
    Object? user = null,
    Object? createdAt = null,
    Object? date = null,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as TaskUserModel,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.type,
      required this.user,
      required this.createdAt,
      required this.date});

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String status;
  @override
  final String type;
  @override
  final TaskUserModel user;
  @override
  final int createdAt;
  @override
  final String date;

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, status: $status, type: $type, user: $user, createdAt: $createdAt, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, status, type, user, createdAt, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {required final String id,
      required final String title,
      required final String description,
      required final String status,
      required final String type,
      required final TaskUserModel user,
      required final int createdAt,
      required final String date}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get status;
  @override
  String get type;
  @override
  TaskUserModel get user;
  @override
  int get createdAt;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskUserModel _$TaskUserModelFromJson(Map<String, dynamic> json) {
  return _TaskUserModel.fromJson(json);
}

/// @nodoc
mixin _$TaskUserModel {
  String get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskUserModelCopyWith<TaskUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskUserModelCopyWith<$Res> {
  factory $TaskUserModelCopyWith(
          TaskUserModel value, $Res Function(TaskUserModel) then) =
      _$TaskUserModelCopyWithImpl<$Res, TaskUserModel>;
  @useResult
  $Res call({String displayName, String? photoUrl});
}

/// @nodoc
class _$TaskUserModelCopyWithImpl<$Res, $Val extends TaskUserModel>
    implements $TaskUserModelCopyWith<$Res> {
  _$TaskUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskUserModelImplCopyWith<$Res>
    implements $TaskUserModelCopyWith<$Res> {
  factory _$$TaskUserModelImplCopyWith(
          _$TaskUserModelImpl value, $Res Function(_$TaskUserModelImpl) then) =
      __$$TaskUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String displayName, String? photoUrl});
}

/// @nodoc
class __$$TaskUserModelImplCopyWithImpl<$Res>
    extends _$TaskUserModelCopyWithImpl<$Res, _$TaskUserModelImpl>
    implements _$$TaskUserModelImplCopyWith<$Res> {
  __$$TaskUserModelImplCopyWithImpl(
      _$TaskUserModelImpl _value, $Res Function(_$TaskUserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? photoUrl = freezed,
  }) {
    return _then(_$TaskUserModelImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskUserModelImpl implements _TaskUserModel {
  const _$TaskUserModelImpl(
      {required this.displayName, required this.photoUrl});

  factory _$TaskUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskUserModelImplFromJson(json);

  @override
  final String displayName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'TaskUserModel(displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskUserModelImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, photoUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskUserModelImplCopyWith<_$TaskUserModelImpl> get copyWith =>
      __$$TaskUserModelImplCopyWithImpl<_$TaskUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskUserModelImplToJson(
      this,
    );
  }
}

abstract class _TaskUserModel implements TaskUserModel {
  const factory _TaskUserModel(
      {required final String displayName,
      required final String? photoUrl}) = _$TaskUserModelImpl;

  factory _TaskUserModel.fromJson(Map<String, dynamic> json) =
      _$TaskUserModelImpl.fromJson;

  @override
  String get displayName;
  @override
  String? get photoUrl;
  @override
  @JsonKey(ignore: true)
  _$$TaskUserModelImplCopyWith<_$TaskUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
