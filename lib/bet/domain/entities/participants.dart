enum ParticipantStatus { active, won, lost, left }

class Participant {
  final String id;
  final String userId;
  final String personId;
  final double initialWeight;
  final double? handicap;
  final double? lastWeight;
  final ParticipantStatus status;

  const Participant({
    required this.id,
    required this.userId,
    required this.personId,
    required this.initialWeight,
    this.handicap,
    this.lastWeight,
    required this.status,
  });
}