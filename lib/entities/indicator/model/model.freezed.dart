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

IndicatorModel _$IndicatorModelFromJson(Map<String, dynamic> json) {
  return _IndicatorModel.fromJson(json);
}

/// @nodoc
mixin _$IndicatorModel {
  String get name => throw _privateConstructorUsedError;
  num get fact => throw _privateConstructorUsedError;
  num get plan => throw _privateConstructorUsedError;
  num get lfl => throw _privateConstructorUsedError;
  num? get forecast => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IndicatorModelCopyWith<IndicatorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IndicatorModelCopyWith<$Res> {
  factory $IndicatorModelCopyWith(
          IndicatorModel value, $Res Function(IndicatorModel) then) =
      _$IndicatorModelCopyWithImpl<$Res, IndicatorModel>;
  @useResult
  $Res call(
      {String name, num fact, num plan, num lfl, num? forecast, String type});
}

/// @nodoc
class _$IndicatorModelCopyWithImpl<$Res, $Val extends IndicatorModel>
    implements $IndicatorModelCopyWith<$Res> {
  _$IndicatorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fact = null,
    Object? plan = null,
    Object? lfl = null,
    Object? forecast = freezed,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as num,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as num,
      lfl: null == lfl
          ? _value.lfl
          : lfl // ignore: cast_nullable_to_non_nullable
              as num,
      forecast: freezed == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as num?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IndicatorModelImplCopyWith<$Res>
    implements $IndicatorModelCopyWith<$Res> {
  factory _$$IndicatorModelImplCopyWith(_$IndicatorModelImpl value,
          $Res Function(_$IndicatorModelImpl) then) =
      __$$IndicatorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, num fact, num plan, num lfl, num? forecast, String type});
}

/// @nodoc
class __$$IndicatorModelImplCopyWithImpl<$Res>
    extends _$IndicatorModelCopyWithImpl<$Res, _$IndicatorModelImpl>
    implements _$$IndicatorModelImplCopyWith<$Res> {
  __$$IndicatorModelImplCopyWithImpl(
      _$IndicatorModelImpl _value, $Res Function(_$IndicatorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? fact = null,
    Object? plan = null,
    Object? lfl = null,
    Object? forecast = freezed,
    Object? type = null,
  }) {
    return _then(_$IndicatorModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fact: null == fact
          ? _value.fact
          : fact // ignore: cast_nullable_to_non_nullable
              as num,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as num,
      lfl: null == lfl
          ? _value.lfl
          : lfl // ignore: cast_nullable_to_non_nullable
              as num,
      forecast: freezed == forecast
          ? _value.forecast
          : forecast // ignore: cast_nullable_to_non_nullable
              as num?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IndicatorModelImpl implements _IndicatorModel {
  const _$IndicatorModelImpl(
      {required this.name,
      required this.fact,
      required this.plan,
      required this.lfl,
      required this.forecast,
      required this.type});

  factory _$IndicatorModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IndicatorModelImplFromJson(json);

  @override
  final String name;
  @override
  final num fact;
  @override
  final num plan;
  @override
  final num lfl;
  @override
  final num? forecast;
  @override
  final String type;

  @override
  String toString() {
    return 'IndicatorModel(name: $name, fact: $fact, plan: $plan, lfl: $lfl, forecast: $forecast, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IndicatorModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fact, fact) || other.fact == fact) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.lfl, lfl) || other.lfl == lfl) &&
            (identical(other.forecast, forecast) ||
                other.forecast == forecast) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, fact, plan, lfl, forecast, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IndicatorModelImplCopyWith<_$IndicatorModelImpl> get copyWith =>
      __$$IndicatorModelImplCopyWithImpl<_$IndicatorModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IndicatorModelImplToJson(
      this,
    );
  }
}

abstract class _IndicatorModel implements IndicatorModel {
  const factory _IndicatorModel(
      {required final String name,
      required final num fact,
      required final num plan,
      required final num lfl,
      required final num? forecast,
      required final String type}) = _$IndicatorModelImpl;

  factory _IndicatorModel.fromJson(Map<String, dynamic> json) =
      _$IndicatorModelImpl.fromJson;

  @override
  String get name;
  @override
  num get fact;
  @override
  num get plan;
  @override
  num get lfl;
  @override
  num? get forecast;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$IndicatorModelImplCopyWith<_$IndicatorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
