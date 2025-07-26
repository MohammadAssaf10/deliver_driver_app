import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/constant.dart';
import '../../domain/entities/history.dart';

part 'history_model.g.dart';

@JsonSerializable(createToJson: false)
class HistoryModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "status")
  final int status;
  @JsonKey(name: "calculatedDistance")
  final double calculatedDistance;
  @JsonKey(name: "calculatedDuration")
  final double calculatedDuration;
  @JsonKey(name: "createdDate")
  final int createdDate;

  HistoryModel({
    required this.id,
    required this.status,
    required this.calculatedDistance,
    required this.calculatedDuration,
    required this.createdDate,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryModelFromJson(json);

  History toDomain() => History(
    id: id,
    status: Constant.tripStatusMap[status]!,
    calculatedDistance: calculatedDistance,
    calculatedDuration: calculatedDuration,
    createdDate: createdDate,
  );
}
