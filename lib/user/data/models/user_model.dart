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
    required super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    // TODO: En caso de ser nulo que va hacer ?
    id: (json["id"] ?? "") as String,
    name: json["name"],
    lastName: (json["lastName"] ?? "") as String,
    email: (json["email"] ?? "") as String,
    phoneNumber: (json["phoneNumber"] ?? "") as String,
    role: _roleFromJson(json["role"]),
    avatarUrl: (json['avatarUrl'] ?? '') as String,
  );

  static ROL _roleFromJson(dynamic raw) {
    if (raw is String) {
      final idx = ROL.values.indexWhere((e) => e.name == raw);
      if (idx != -1) return ROL.values[idx];
    }
    return ROL.user; // default
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "role": role.name,
    'avatarUrl': avatarUrl,
  };

  toEntity() {
    return User(
      id: id,
      name: name,
      lastName: lastName,
      email: email,
      phoneNumber: phoneNumber,
      role: role,
      avatarUrl: avatarUrl,
    );
  }
}
