import 'package:app_weight/weight/domain/entities/weight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightsModel extends Weight {
  WeightsModel({
    required super.id,
    required super.unit,
    required super.weight,
    required super.imc,
    required super.dateWeight,
  });

  factory WeightsModel.fromJson(Map<String, dynamic> json, {String? docId}) => WeightsModel(
      id: (json["id"] as String?) ?? docId ?? "",
      unit: json["unit"],
      weight: json["weight"]?.toDouble(),
      imc: json["imc"]?.toDouble(),
      dateWeight: (json["dateWeight"] as Timestamp).toDate(),
  );

  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "weight": weight,
  //     "imc": imc,
  //     "dateWeight": "${dateWeight.year.toString().padLeft(4, '0')}-${dateWeight.month.toString().padLeft(2, '0')}-${dateWeight.day.toString().padLeft(2, '0')}",
  // };
}
