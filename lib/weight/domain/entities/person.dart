// import 'dart:convert';

// Person personFromJson(String str) => Person.fromJson(json.decode(str));

// String personToJson(Person data) => json.encode(data.toJson());

class Person {
    final String id;
    final String name;
    final int rating;
    final DateTime dateOfBirth;
    final int likes;
    final String gender;
    final int height;
    final String img;

    Person({
        required this.id,
        required this.name,
        required this.rating,
        required this.dateOfBirth,
        required this.likes,
        required this.gender,
        required this.height,
        required this.img,
    });

    Person copyWith({
        String? id,
        String? name,
        int? rating,
        DateTime? dateOfBirth,
        int? likes,
        String? gender,
        int? height,
        String? img,
    }) => 
        Person(
            id: id ?? this.id,
            name: name ?? this.name,
            rating: rating ?? this.rating,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            likes: likes ?? this.likes,
            gender: gender ?? this.gender,
            height: height ?? this.height,
            img: img ?? this.img,
        );

    // factory Person.fromJson(Map<String, dynamic> json) => Person(
    //     id: json["id"],
    //     name: json["name"],
    //     rating: json["rating"],
    //     dateOfBirth: DateTime.parse(json["dateOfBirth"]),
    //     likes: json["likes"],
    //     gender: json["gender"],
    //     height: json["height"],
    //     img: json["img"],
    // );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "rating": rating,
    //     "dateOfBirth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
    //     "likes": likes,
    //     "gender": gender,
    //     "height": height,
    //     "img": img,
    // };
}
