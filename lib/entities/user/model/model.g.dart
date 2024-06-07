// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      displayName: json['displayName'] as String,
      photoUrl: json['photoUrl'] as String?,
      dateBirth: json['dateBirth'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as String?,
      position: json['position'] as String?,
      createdAt: (json['createdAt'] as num).toInt(),
      isBlocked: json['isBlocked'] as bool,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'role': instance.role,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'dateBirth': instance.dateBirth,
      'phone': instance.phone,
      'gender': instance.gender,
      'position': instance.position,
      'createdAt': instance.createdAt,
      'isBlocked': instance.isBlocked,
    };
