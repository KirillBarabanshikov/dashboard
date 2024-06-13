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
      user: TaskUserModel.fromJson(json['user'] as Map<String, dynamic>),
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
      'user': instance.user,
      'createdAt': instance.createdAt,
      'date': instance.date,
    };

_$TaskUserModelImpl _$$TaskUserModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskUserModelImpl(
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$TaskUserModelImplToJson(_$TaskUserModelImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
    };
