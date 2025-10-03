// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bet_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(betRemoteDataSource)
const betRemoteDataSourceProvider = BetRemoteDataSourceProvider._();

final class BetRemoteDataSourceProvider
    extends $FunctionalProvider<BetDatasource, BetDatasource, BetDatasource>
    with $Provider<BetDatasource> {
  const BetRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'betRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$betRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<BetDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BetDatasource create(Ref ref) {
    return betRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BetDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BetDatasource>(value),
    );
  }
}

String _$betRemoteDataSourceHash() =>
    r'65e6c5e5fa731f8d2a9da11fbfd20e20d0060b68';

@ProviderFor(betRepository)
const betRepositoryProvider = BetRepositoryProvider._();

final class BetRepositoryProvider
    extends $FunctionalProvider<BetRepository, BetRepository, BetRepository>
    with $Provider<BetRepository> {
  const BetRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'betRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$betRepositoryHash();

  @$internal
  @override
  $ProviderElement<BetRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BetRepository create(Ref ref) {
    return betRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BetRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BetRepository>(value),
    );
  }
}

String _$betRepositoryHash() => r'5997b50f79e328a09fb352657881f54b8d7803c3';

@ProviderFor(betById)
const betByIdProvider = BetByIdFamily._();

final class BetByIdProvider
    extends $FunctionalProvider<AsyncValue<Bet?>, Bet?, FutureOr<Bet?>>
    with $FutureModifier<Bet?>, $FutureProvider<Bet?> {
  const BetByIdProvider._({
    required BetByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'betByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$betByIdHash();

  @override
  String toString() {
    return r'betByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Bet?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Bet?> create(Ref ref) {
    final argument = this.argument as String;
    return betById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BetByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$betByIdHash() => r'022525f9b7e097bc126b002554df69af16da2fe3';

final class BetByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Bet?>, String> {
  const BetByIdFamily._()
    : super(
        retry: null,
        name: r'betByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BetByIdProvider call(String id) =>
      BetByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'betByIdProvider';
}

@ProviderFor(betAll)
const betAllProvider = BetAllProvider._();

final class BetAllProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Bet>?>,
          List<Bet>?,
          FutureOr<List<Bet>?>
        >
    with $FutureModifier<List<Bet>?>, $FutureProvider<List<Bet>?> {
  const BetAllProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'betAllProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$betAllHash();

  @$internal
  @override
  $FutureProviderElement<List<Bet>?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Bet>?> create(Ref ref) {
    return betAll(ref);
  }
}

String _$betAllHash() => r'd365680c57b1a4966aa73799d62993f38d4dd460';
