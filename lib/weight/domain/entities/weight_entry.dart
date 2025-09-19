import 'dart:convert';

Person personFromJson(String str) => Person.fromJson(json.decode(str));

String personToJson(Person data) => json.encode(data.toJson());

class Person {
    final String id;
    final int weight;
    final double imc;
    final DateTime dateWeight;

    Person({
        required this.id,
        required this.weight,
        required this.imc,
        required this.dateWeight,
    });

    Person copyWith({
        String? id,
        int? weight,
        double? imc,
        DateTime? dateWeight,
    }) => 
        Person(
            id: id ?? this.id,
            weight: weight ?? this.weight,
            imc: imc ?? this.imc,
            dateWeight: dateWeight ?? this.dateWeight,
        );

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        weight: json["weight"],
        imc: json["imc"]?.toDouble(),
        dateWeight: DateTime.parse(json["dateWeight"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "weight": weight,
        "imc": imc,
        "dateWeight": "${dateWeight.year.toString().padLeft(4, '0')}-${dateWeight.month.toString().padLeft(2, '0')}-${dateWeight.day.toString().padLeft(2, '0')}",
    };
}
