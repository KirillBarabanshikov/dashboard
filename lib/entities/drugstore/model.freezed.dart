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

DrugstoreModel _$DrugstoreModelFromJson(Map<String, dynamic> json) {
  return _DrugstoreModel.fromJson(json);
}

/// @nodoc
mixin _$DrugstoreModel {
  String get id => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;
  int get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugstoreModelCopyWith<DrugstoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugstoreModelCopyWith<$Res> {
  factory $DrugstoreModelCopyWith(
          DrugstoreModel value, $Res Function(DrugstoreModel) then) =
      _$DrugstoreModelCopyWithImpl<$Res, DrugstoreModel>;
  @useResult
  $Res call(
      {String id,
      String address,
      String brand,
      String city,
      String? description,
      String name,
      String region,
      int createdAt});
}

/// @nodoc
class _$DrugstoreModelCopyWithImpl<$Res, $Val extends DrugstoreModel>
    implements $DrugstoreModelCopyWith<$Res> {
  _$DrugstoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? brand = null,
    Object? city = null,
    Object? description = freezed,
    Object? name = null,
    Object? region = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DrugstoreModelImplCopyWith<$Res>
    implements $DrugstoreModelCopyWith<$Res> {
  factory _$$DrugstoreModelImplCopyWith(_$DrugstoreModelImpl value,
          $Res Function(_$DrugstoreModelImpl) then) =
      __$$DrugstoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String address,
      String brand,
      String city,
      String? description,
      String name,
      String region,
      int createdAt});
}

/// @nodoc
class __$$DrugstoreModelImplCopyWithImpl<$Res>
    extends _$DrugstoreModelCopyWithImpl<$Res, _$DrugstoreModelImpl>
    implements _$$DrugstoreModelImplCopyWith<$Res> {
  __$$DrugstoreModelImplCopyWithImpl(
      _$DrugstoreModelImpl _value, $Res Function(_$DrugstoreModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? address = null,
    Object? brand = null,
    Object? city = null,
    Object? description = freezed,
    Object? name = null,
    Object? region = null,
    Object? createdAt = null,
  }) {
    return _then(_$DrugstoreModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrugstoreModelImpl implements _DrugstoreModel {
  const _$DrugstoreModelImpl(
      {required this.id,
      required this.address,
      required this.brand,
      required this.city,
      required this.description,
      required this.name,
      required this.region,
      required this.createdAt});

  factory _$DrugstoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrugstoreModelImplFromJson(json);

  @override
  final String id;
  @override
  final String address;
  @override
  final String brand;
  @override
  final String city;
  @override
  final String? description;
  @override
  final String name;
  @override
  final String region;
  @override
  final int createdAt;

  @override
  String toString() {
    return 'DrugstoreModel(id: $id, address: $address, brand: $brand, city: $city, description: $description, name: $name, region: $region, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugstoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, address, brand, city,
      description, name, region, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugstoreModelImplCopyWith<_$DrugstoreModelImpl> get copyWith =>
      __$$DrugstoreModelImplCopyWithImpl<_$DrugstoreModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrugstoreModelImplToJson(
      this,
    );
  }
}

abstract class _DrugstoreModel implements DrugstoreModel {
  const factory _DrugstoreModel(
      {required final String id,
      required final String address,
      required final String brand,
      required final String city,
      required final String? description,
      required final String name,
      required final String region,
      required final int createdAt}) = _$DrugstoreModelImpl;

  factory _DrugstoreModel.fromJson(Map<String, dynamic> json) =
      _$DrugstoreModelImpl.fromJson;

  @override
  String get id;
  @override
  String get address;
  @override
  String get brand;
  @override
  String get city;
  @override
  String? get description;
  @override
  String get name;
  @override
  String get region;
  @override
  int get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$DrugstoreModelImplCopyWith<_$DrugstoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
