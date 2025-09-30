// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
import 'dart:convert';

import 'package:app_weight/user/domain/entities/user.dart';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {

  UserModel({
    required super.id,
    required super.name,
    required super.lastName,
    required super.email,
    required super.phoneNumber,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    // TODO: En caso de ser nulo que va hacer ?
    id: json["id"],
    name: json["name"],
    lastName: json["lastName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    role: ROL.values.byName(json["role"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role.name,
  };

  toEntity() {
    return User(
      id: id,
      name: name,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      role: role,
    );
  }
}
