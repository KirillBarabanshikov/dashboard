import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';
part 'model.g.dart';

@freezed
class IndicatorModel with _$IndicatorModel {
  const factory IndicatorModel({
    required String name,
    required num fact,
    required num plan,
    required num lfl,
    required num? forecast,
    required String type,
  }) = _IndicatorModel;

  factory IndicatorModel.fromJson(Map<String, Object?> json) => _$IndicatorModelFromJson(json);
}
