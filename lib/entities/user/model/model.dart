import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    required String email,
    required String role,
    required String displayName,
    required String? photoUrl,
    required String? dateBirth,
    required String? phone,
    required String? gender,
    required String? position,
    required int createdAt,
    required bool isBlocked,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
