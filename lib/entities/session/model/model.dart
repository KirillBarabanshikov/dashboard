import 'package:hive_flutter/hive_flutter.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class SessionUser extends HiveObject {
  SessionUser({
    required this.uid,
    required this.email,
    required this.role,
    required this.displayName,
    required this.photoUrl,
    required this.createdAt,
    required this.isBlocked,
  });

  @HiveField(0)
  String uid;

  @HiveField(1)
  String email;

  @HiveField(2)
  String role;

  @HiveField(3)
  String displayName;

  @HiveField(4)
  String? photoUrl;

  @HiveField(5)
  int? createdAt;

  @HiveField(6)
  bool isBlocked;
}
