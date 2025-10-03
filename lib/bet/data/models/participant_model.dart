import 'package:app_weight/bet/domain/entities/participants.dart';

class ParticipantModel extends Participant {
  ParticipantModel({
    required super.id,
    required super.userId,
    required super.personId,
    required super.initialWeight,
    required super.status,
  });

  factory ParticipantModel.fromJson(
    Map<String, dynamic> json, {
    String? docId,
  }) => ParticipantModel(
    id: (json["id"] as String?) ?? docId ?? "",
    userId: json['userId'],
    personId: json['personId'],
    initialWeight: json['initialWeight'],
    status: json['status'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'personId': personId,
      'initialWeight': initialWeight,
      'status': status,
    };
  }

  toEntity() {
    return Participant(
      id: id,
      userId: userId,
      personId: personId,
      initialWeight: initialWeight,
      status: status,
    );
  }
}
