import 'package:app_weight/bet/domain/usecases/watch_bet_details.dart';
import 'package:app_weight/bet/domain/usecases/watch_bet_details_impl.dart';
import 'package:app_weight/bet/presentation/providers/bet_provider.dart';
import 'package:app_weight/bet/presentation/providers/participant_provider.dart';
import 'package:app_weight/weight/presentation/providers/person_providers.dart';
import 'package:app_weight/weight/presentation/providers/weights_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bet_details_provider.g.dart';

class BetDetailsParams {
  final String betId;
  final int? weightsLimit;

  BetDetailsParams({required this.betId, this.weightsLimit});
}

@Riverpod(keepAlive: true)
WatchBetDetails watchBetDetailsUseCase(Ref ref) {
  return WatchBetDetailsImpl(
    ref.read(betRepositoryProvider),
    ref.read(weightsRepositoryProvider),
    ref.read(personRepositoryProvider),
    ref.read(participantRepositoryProvider),
  );
}

@Riverpod(keepAlive: false)
Stream<BetDetails> watchBetDetails(Ref ref, BetDetailsParams params) {
  final uc = ref.watch(watchBetDetailsUseCaseProvider);
  // Si quieres evitar re-suscripciones por el mismo id:
  // ref.cacheFor(const Duration(minutes: 5)); // (si usas riverpod_lint >= 3)
  return uc(params.betId, weightsLimit: params.weightsLimit);
}
