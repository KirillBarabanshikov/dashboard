// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndicatorModelImpl _$$IndicatorModelImplFromJson(Map<String, dynamic> json) =>
    _$IndicatorModelImpl(
      name: json['name'] as String,
      fact: json['fact'] as num,
      plan: json['plan'] as num,
      lfl: json['lfl'] as num,
      forecast: json['forecast'] as num?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$IndicatorModelImplToJson(
        _$IndicatorModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'fact': instance.fact,
      'plan': instance.plan,
      'lfl': instance.lfl,
      'forecast': instance.forecast,
      'type': instance.type,
    };
