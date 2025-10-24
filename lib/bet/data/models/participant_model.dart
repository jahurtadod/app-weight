import 'package:app_weight/bet/domain/entities/participants.dart';

class ParticipantModel extends Participant {
  ParticipantModel({
    required super.id,
    required super.personId,
    required super.initialWeight,
    required super.status,
  });

  factory ParticipantModel.fromJson(
    Map<String, dynamic> json, {
    String? docId,
  }) => ParticipantModel(
    id: (json["id"] as String?) ?? docId ?? "",
    personId: json['personId'],
    initialWeight: json['initialWeight'],
    status: ParticipantStatusX.fromStorage(json['status']),
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'personId': personId,
      'initialWeight': initialWeight,
      'status': status,
    };
  }

  toEntity() {
    return Participant(
      id: id,
      personId: personId,
      initialWeight: initialWeight,
      status: status,
    );
  }
}

extension ParticipantStatusX on ParticipantStatus {
  /// Convierte el enum a su representación en texto para almacenar en Firestore o JSON.
  String toStorage() {
    switch (this) {
      case ParticipantStatus.active:
        return 'active';
      case ParticipantStatus.won:
        return 'won';
      case ParticipantStatus.lost:
        return 'lost';
      case ParticipantStatus.left:
        return 'left';
    }
  }

  /// Convierte una cadena del almacenamiento al enum correspondiente.
  static ParticipantStatus fromStorage(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'active':
        return ParticipantStatus.active;
      case 'won':
        return ParticipantStatus.won;
      case 'lost':
        return ParticipantStatus.lost;
      case 'left':
        return ParticipantStatus.left;
      default:
        return ParticipantStatus.active;
    }
  }
}
