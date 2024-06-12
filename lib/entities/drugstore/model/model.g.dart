// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DrugstoreModelImpl _$$DrugstoreModelImplFromJson(Map<String, dynamic> json) =>
    _$DrugstoreModelImpl(
      id: json['id'] as String,
      address: json['address'] as String,
      brand: json['brand'] as String,
      city: json['city'] as String,
      description: json['description'] as String?,
      name: json['name'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$$DrugstoreModelImplToJson(
        _$DrugstoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'brand': instance.brand,
      'city': instance.city,
      'description': instance.description,
      'name': instance.name,
      'region': instance.region,
    };
