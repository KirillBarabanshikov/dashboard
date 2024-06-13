import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    required String description,
    required String status,
    required String type,
    required TaskUserModel user,
    required int createdAt,
    required String date,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) => _$TaskModelFromJson(json);
}

@freezed
class TaskUserModel with _$TaskUserModel {
  const factory TaskUserModel({
    required String displayName,
    required String? photoUrl,
  }) = _TaskUserModel;

  factory TaskUserModel.fromJson(Map<String, Object?> json) => _$TaskUserModelFromJson(json);
}
