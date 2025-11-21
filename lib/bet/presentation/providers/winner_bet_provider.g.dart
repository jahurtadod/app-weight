// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winner_bet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(winnerBetRemoteDataSource)
const winnerBetRemoteDataSourceProvider = WinnerBetRemoteDataSourceProvider._();

final class WinnerBetRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          WinnerBetDatasource,
          WinnerBetDatasource,
          WinnerBetDatasource
        >
    with $Provider<WinnerBetDatasource> {
  const WinnerBetRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'winnerBetRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$winnerBetRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<WinnerBetDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WinnerBetDatasource create(Ref ref) {
    return winnerBetRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WinnerBetDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WinnerBetDatasource>(value),
    );
  }
}

String _$winnerBetRemoteDataSourceHash() =>
    r'5f329118f56754954817e3051cf286a1ed2d19ef';

@ProviderFor(winnerBetRepository)
const winnerBetRepositoryProvider = WinnerBetRepositoryProvider._();

final class WinnerBetRepositoryProvider
    extends
        $FunctionalProvider<
          WinnerBetRepository,
          WinnerBetRepository,
          WinnerBetRepository
        >
    with $Provider<WinnerBetRepository> {
  const WinnerBetRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'winnerBetRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$winnerBetRepositoryHash();

  @$internal
  @override
  $ProviderElement<WinnerBetRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WinnerBetRepository create(Ref ref) {
    return winnerBetRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WinnerBetRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WinnerBetRepository>(value),
    );
  }
}

String _$winnerBetRepositoryHash() =>
    r'5b780f11ffb2e52d98f6aa9bbb2d0ad4cc943089';

@ProviderFor(winnerBetAll)
const winnerBetAllProvider = WinnerBetAllFamily._();

final class WinnerBetAllProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<WinnerBet?>>,
          List<WinnerBet?>,
          FutureOr<List<WinnerBet?>>
        >
    with $FutureModifier<List<WinnerBet?>>, $FutureProvider<List<WinnerBet?>> {
  const WinnerBetAllProvider._({
    required WinnerBetAllFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'winnerBetAllProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$winnerBetAllHash();

  @override
  String toString() {
    return r'winnerBetAllProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<WinnerBet?>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<WinnerBet?>> create(Ref ref) {
    final argument = this.argument as String;
    return winnerBetAll(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WinnerBetAllProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$winnerBetAllHash() => r'b1d7242a192bcf3b0d00a48a67cad1164056a576';

final class WinnerBetAllFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<WinnerBet?>>, String> {
  const WinnerBetAllFamily._()
    : super(
        retry: null,
        name: r'winnerBetAllProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WinnerBetAllProvider call(String betId) =>
      WinnerBetAllProvider._(argument: betId, from: this);

  @override
  String toString() => r'winnerBetAllProvider';
}
