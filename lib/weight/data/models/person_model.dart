import 'package:app_weight/weight/domain/entities/person.dart';

class PersonModel extends Person {
  PersonModel({
    required super.id,
    required super.name,
    required super.rating,
    required super.dateOfBirth,
    required super.likes,
    required super.gender,
    required super.height,
    required super.img,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
    id: json["id"],
    name: json["name"],
    rating: json["rating"],
    dateOfBirth: DateTime.parse(json["dateOfBirth"]),
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
}
