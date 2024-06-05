// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      type: json['type'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: (json['createdAt'] as num).toInt(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'type': instance.type,
      'users': instance.users,
      'createdAt': instance.createdAt,
      'date': instance.date,
    };
