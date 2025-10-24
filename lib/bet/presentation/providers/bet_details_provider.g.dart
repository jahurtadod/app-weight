// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchBetDetailsUseCase)
const watchBetDetailsUseCaseProvider = WatchBetDetailsUseCaseProvider._();

final class WatchBetDetailsUseCaseProvider
    extends
        $FunctionalProvider<WatchBetDetails, WatchBetDetails, WatchBetDetails>
    with $Provider<WatchBetDetails> {
  const WatchBetDetailsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchBetDetailsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchBetDetailsUseCaseHash();

  @$internal
  @override
  $ProviderElement<WatchBetDetails> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WatchBetDetails create(Ref ref) {
    return watchBetDetailsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WatchBetDetails value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WatchBetDetails>(value),
    );
  }
}

String _$watchBetDetailsUseCaseHash() =>
    r'57ce6e162c6992a93767a0756d58433d0da63cb0';

@ProviderFor(watchBetDetails)
const watchBetDetailsProvider = WatchBetDetailsFamily._();

final class WatchBetDetailsProvider
    extends
        $FunctionalProvider<
          AsyncValue<BetDetails>,
          BetDetails,
          Stream<BetDetails>
        >
    with $FutureModifier<BetDetails>, $StreamProvider<BetDetails> {
  const WatchBetDetailsProvider._({
    required WatchBetDetailsFamily super.from,
    required BetDetailsParams super.argument,
  }) : super(
         retry: null,
         name: r'watchBetDetailsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchBetDetailsHash();

  @override
  String toString() {
    return r'watchBetDetailsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<BetDetails> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<BetDetails> create(Ref ref) {
    final argument = this.argument as BetDetailsParams;
    return watchBetDetails(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchBetDetailsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchBetDetailsHash() => r'181bfaeb38c8706d1b3b71e21a78bdc76a13de38';

final class WatchBetDetailsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<BetDetails>, BetDetailsParams> {
  const WatchBetDetailsFamily._()
    : super(
        retry: null,
        name: r'watchBetDetailsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchBetDetailsProvider call(BetDetailsParams params) =>
      WatchBetDetailsProvider._(argument: params, from: this);

  @override
  String toString() => r'watchBetDetailsProvider';
}
