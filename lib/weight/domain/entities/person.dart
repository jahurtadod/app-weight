class Person {
  final String id;
  final String name;
  final int rating;
  final DateTime dateOfBirth;
  final int likes;
  final String gender;
  final int height;
  final String img;
  final double lastWeight;
  final double initialWeight;

  Person({
    required this.id,
    required this.name,
    required this.rating,
    required this.dateOfBirth,
    required this.likes,
    required this.gender,
    required this.height,
    required this.img,
    required this.lastWeight,
    required this.initialWeight,
  });

  // Person copyWith({
  //   String? id,
  //   String? name,
  //   int? rating,
  //   DateTime? dateOfBirth,
  //   int? likes,
  //   String? gender,
  //   int? height,
  //   String? img,
  // }) => Person(
  //   id: id ?? this.id,
  //   name: name ?? this.name,
  //   rating: rating ?? this.rating,
  //   dateOfBirth: dateOfBirth ?? this.dateOfBirth,
  //   likes: likes ?? this.likes,
  //   gender: gender ?? this.gender,
  //   height: height ?? this.height,
  //   img: img ?? this.img,
  // );
}
