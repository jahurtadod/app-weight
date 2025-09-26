import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonModel extends Person {
  PersonModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.dateOfBirth,
    required super.likes,
    required super.gender,
    required super.height,
    required super.lastWeight,
    required super.initialWeight,
    required super.img,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json, {String? docId})  => PersonModel(
    id: (json["id"] as String?) ?? docId ?? "",
    name: json["name"],
    rating: json["rating"],
    lastWeight: json["lastWeight"] as double? ?? 0.0,
    initialWeight: json["initialWeight"] as double? ?? 0.0,
    dateOfBirth: (json["dateOfBirth"] as Timestamp).toDate(),
    likes: json["likes"],
    gender: json["gender"],
    height: json["height"],
    img: json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "rating": rating,
    "dateOfBirth":
        "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    "likes": likes,
    "gender": gender,
    "height": height,
    "img": img,
  };

  toEntity() {
    return Person(
      id: id,
      name: name,
      lastWeight: lastWeight,
      initialWeight: initialWeight,
      rating: rating,
      dateOfBirth: dateOfBirth,
      likes: likes,
      gender: gender,
      height: height,
      img: img,
    );
  }
}
