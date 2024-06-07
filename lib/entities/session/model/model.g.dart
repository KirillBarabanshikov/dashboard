// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionUserAdapter extends TypeAdapter<SessionUser> {
  @override
  final int typeId = 0;

  @override
  SessionUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionUser(
      uid: fields[0] as String,
      email: fields[1] as String,
      role: fields[2] as String,
      displayName: fields[3] as String,
      photoUrl: fields[4] as String?,
      dateBirth: fields[5] as String?,
      phone: fields[6] as String?,
      gender: fields[7] as String?,
      position: fields[8] as String?,
      createdAt: fields[9] as int?,
      isBlocked: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SessionUser obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.role)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.photoUrl)
      ..writeByte(5)
      ..write(obj.dateBirth)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.gender)
      ..writeByte(8)
      ..write(obj.position)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.isBlocked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
