import 'package:app_weight/bet/domain/entities/winner_bet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WinnerBetModel extends WinnerBet {
  WinnerBetModel({
    required super.id,
    required super.betId,
    required super.bettorUserId,
    required super.targetParticipantId,
    required super.amount,
    required super.odds,
    required super.status,
    required super.createdAt,
    required super.displayName,
    required super.targetParticipantName,
    super.payoutAmount,
  });

  factory WinnerBetModel.fromJson(Map<String, dynamic> json, {String? docId}) {
    return WinnerBetModel(
      id: (json['id'] as String?) ?? docId ?? "",
      betId: json['betId'],
      bettorUserId: json['bettorUserId'],
      displayName: json['displayName'],
      targetParticipantId: json['targetParticipantId'],
      amount: (json['amount'] as num).toDouble(),
      odds: (json['odds'] as num).toDouble(),
      status: WinnerBetStatusX.fromStorage(json['status']),
      payoutAmount: (json['payoutAmount'] as num?)?.toDouble(),
      targetParticipantName: json['targetParticipantName'] ?? '',
      createdAt:
          (json["createdAt"] as Timestamp).toDate(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'betId': betId,
      'bettorUserId': bettorUserId,
      'targetParticipantId': targetParticipantId,
      'amount': amount,
      'odds': odds,
      'status': status.toStorage(),
      'payoutAmount': payoutAmount,
      'createdAt': createdAt.toIso8601String(),
      'displayName': displayName,
      'targetParticipantName': targetParticipantName,
    };
  }

  WinnerBet toEntity() {
    return WinnerBet(
      id: id,
      betId: betId,
      bettorUserId: bettorUserId,
      targetParticipantId: targetParticipantId,
      amount: amount,
      odds: odds,
      status: status,
      payoutAmount: payoutAmount,
      createdAt: createdAt,
      resolvedAt: resolvedAt,
      displayName: displayName,
      targetParticipantName: targetParticipantName,
    );
  }
}

extension WinnerBetStatusX on WinnerBetStatus {
  String toStorage() {
    switch (this) {
      case WinnerBetStatus.open:
        return 'open';
      case WinnerBetStatus.won:
        return 'won';
      case WinnerBetStatus.lost:
        return 'lost';
      case WinnerBetStatus.voided:
        return 'void';
    }
  }

  static WinnerBetStatus fromStorage(String? value) {
    switch (value?.trim().toLowerCase()) {
      case 'open':
        return WinnerBetStatus.open;
      case 'won':
        return WinnerBetStatus.won;
      case 'lost':
        return WinnerBetStatus.lost;
      case 'void':
      case 'voided':
        return WinnerBetStatus.voided;
      default:
        return WinnerBetStatus.open;
    }
  }
}
