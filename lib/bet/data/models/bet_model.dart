import 'package:app_weight/bet/domain/entities/bet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BetModel extends Bet {
  BetModel({
    required super.id,
    required super.title,
    required super.startDate,
    required super.endDate,
    required super.status,
    required super.stakeType,
    required super.stakeValue,
    required super.participantsCount,
    required super.rules,
  });

  factory BetModel.fromJson(Map<String, dynamic> json, {String? docId}) =>
      BetModel(
        id: (json["id"] as String?) ?? docId ?? "",
        title: json['title'],
        startDate: (json["startDate"] as Timestamp).toDate(),
        endDate: (json["endDate"] as Timestamp).toDate(),
        status: BetStatusX.fromStorage(json['status']),
        stakeType: StakeTypeX.fromStorage(json['stakeType']),
        stakeValue: json['stakeValue'],
        participantsCount: json['participantsCount'],
        rules: BetRulesModel.fromJson(json['rules']),
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'status': status,
      'stakeType': stakeType,
      'stakeValue': stakeValue,
      'participantsCount': participantsCount,
      'rules': BetRulesModel.fromEntity(rules).toJson(),
    };
  }

  toEntity() => Bet(
    id: id,
    title: title,
    startDate: startDate,
    endDate: endDate,
    status: status,
    stakeType: stakeType,
    stakeValue: stakeValue,
    participantsCount: participantsCount,
    rules: BetRulesModel.fromEntity(rules).toEntity(),
  );
}

class BetRulesModel extends BetRules {
  BetRulesModel({required super.tolKg, required super.minWeighingIntervalDays});

  factory BetRulesModel.fromJson(Map<String, dynamic> json) {
    return BetRulesModel(
      tolKg: json['tolKg'],
      minWeighingIntervalDays: json['minWeighingIntervalDays'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'tolKg': tolKg, 'minWeighingIntervalDays': minWeighingIntervalDays};
  }

  factory BetRulesModel.fromEntity(BetRules e) => BetRulesModel(
    tolKg: e.tolKg,
    minWeighingIntervalDays: e.minWeighingIntervalDays,
  );

  BetRules toEntity() =>
      BetRules(tolKg: tolKg, minWeighingIntervalDays: minWeighingIntervalDays);
}

extension BetStatusX on BetStatus {
  // Cómo se guarda en JSON/Firestore
  String toStorage() {
    switch (this) {
      case BetStatus.draft:
        return 'draft';
      case BetStatus.active:
        return 'active';
      case BetStatus.finished:
        return 'finished';
      case BetStatus.canceled:
        return 'canceled';
    }
  }

  // Cómo se lee desde JSON/Firestore
  static BetStatus fromStorage(String value) {
    switch (value.trim().toLowerCase()) {
      case 'draft':
        return BetStatus.draft;
      case 'active':
        return BetStatus.active;
      case 'finished':
        return BetStatus.finished;
      case 'canceled':
        return BetStatus.canceled;
      default:
        return BetStatus.draft;
    }
  }
}

extension StakeTypeX on StakeType {
  // Cómo se guarda en JSON/Firestore
  String toStorage() {
    switch (this) {
      case StakeType.none:
        return 'none';
      case StakeType.money:
        return 'money';
      case StakeType.points:
        return 'points';
    }
  }

  // Cómo se lee desde JSON/Firestore
  static StakeType fromStorage(String value) {
    switch (value.trim().toLowerCase()) {
      case 'none':
        return StakeType.none;
      case 'money':
        return StakeType.money;
      case 'points':
        return StakeType.points;
      default:
        return StakeType.none;
    }
  }
}
