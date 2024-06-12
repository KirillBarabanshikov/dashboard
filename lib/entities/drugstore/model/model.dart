import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class DrugstoreModel with _$DrugstoreModel {
  const factory DrugstoreModel({
    required String id,
    required String address,
    required String brand,
    required String city,
    required String? description,
    required String name,
    required String region,
  }) = _DrugstoreModel;

  factory DrugstoreModel.fromJson(Map<String, Object?> json) => _$DrugstoreModelFromJson(json);
}
