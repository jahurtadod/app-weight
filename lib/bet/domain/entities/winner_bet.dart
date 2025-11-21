enum WinnerBetStatus {
  open,   // aún no se resuelve
  won,    // acertó al ganador
  lost,   // no acertó
  voided, // anulada / cancelada
}

class WinnerBet {
  final String id;                    
  final String betId;                 
  final String bettorUserId;          
  final String targetParticipantId;  
  final String displayName;
  final String targetParticipantName;

  final double amount;                
  final double odds;                 

  final WinnerBetStatus status;       
  final double? payoutAmount;         
  final DateTime createdAt;           
  final DateTime? resolvedAt;         

  const WinnerBet({
    required this.id,
    required this.betId,
    required this.bettorUserId,
    required this.targetParticipantId,
    required this.amount,
    required this.odds,
    required this.status,
    required this.createdAt,
    required this.displayName,
    required this.targetParticipantName,
    this.payoutAmount,
    this.resolvedAt,
  });

  /// ¿La apuesta fue ganadora?
  bool get isWon => status == WinnerBetStatus.won;

  double get netProfit {
    if (!isWon || payoutAmount == 0.0) return 0;
    return payoutAmount! - amount;
  }

  WinnerBet copyWith({
    String? id,
    String? betId,
    String? bettorUserId,
    String? targetParticipantId,
    double? amount,
    double? odds,
    WinnerBetStatus? status,
    double? payoutAmount,
    DateTime? createdAt,
    DateTime? resolvedAt,
    String? betTitle,
    String? targetDisplayName,
  }) {
    return WinnerBet(
      id: id ?? this.id,
      betId: betId ?? this.betId,
      bettorUserId: bettorUserId ?? this.bettorUserId,
      targetParticipantId: targetParticipantId ?? this.targetParticipantId,
      amount: amount ?? this.amount,
      odds: odds ?? this.odds,
      status: status ?? this.status,
      payoutAmount: payoutAmount ?? this.payoutAmount,
      createdAt: createdAt ?? this.createdAt,
      resolvedAt: resolvedAt ?? this.resolvedAt,
      displayName: displayName,
      targetParticipantName: targetParticipantName,
    );
  }
}