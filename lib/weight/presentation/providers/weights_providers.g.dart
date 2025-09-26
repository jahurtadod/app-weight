// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weights_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider del DataSource (inyecta FirebaseFirestore)

@ProviderFor(weightsRemoteDataSource)
const weightsRemoteDataSourceProvider = WeightsRemoteDataSourceProvider._();

/// Provider del DataSource (inyecta FirebaseFirestore)

final class WeightsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          WeightsDatasource,
          WeightsDatasource,
          WeightsDatasource
        >
    with $Provider<WeightsDatasource> {
  /// Provider del DataSource (inyecta FirebaseFirestore)
  const WeightsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weightsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weightsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<WeightsDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeightsDatasource create(Ref ref) {
    return weightsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeightsDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeightsDatasource>(value),
    );
  }
}

String _$weightsRemoteDataSourceHash() =>
    r'c5f7f01cd077d382f3eb64e83bf72dbbadd065fc';

@ProviderFor(weightsRepository)
const weightsRepositoryProvider = WeightsRepositoryProvider._();

final class WeightsRepositoryProvider
    extends
        $FunctionalProvider<
          WeightsRepository,
          WeightsRepository,
          WeightsRepository
        >
    with $Provider<WeightsRepository> {
  const WeightsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'weightsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$weightsRepositoryHash();

  @$internal
  @override
  $ProviderElement<WeightsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WeightsRepository create(Ref ref) {
    return weightsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WeightsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WeightsRepository>(value),
    );
  }
}

String _$weightsRepositoryHash() => r'9c607c5232ab6bd4544f623a55a9a8d37b6e8f61';

@ProviderFor(watchWeightsByPerson)
const watchWeightsByPersonProvider = WatchWeightsByPersonFamily._();

final class WatchWeightsByPersonProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<dynamic>?>,
          List<dynamic>?,
          Stream<List<dynamic>?>
        >
    with $FutureModifier<List<dynamic>?>, $StreamProvider<List<dynamic>?> {
  const WatchWeightsByPersonProvider._({
    required WatchWeightsByPersonFamily super.from,
    required (String, int?) super.argument,
  }) : super(
         retry: null,
         name: r'watchWeightsByPersonProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchWeightsByPersonHash();

  @override
  String toString() {
    return r'watchWeightsByPersonProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<dynamic>?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<dynamic>?> create(Ref ref) {
    final argument = this.argument as (String, int?);
    return watchWeightsByPerson(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchWeightsByPersonProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchWeightsByPersonHash() =>
    r'9c9f2d3b3fad1a86cea6747b14df68265d4ec5a6';

final class WatchWeightsByPersonFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<dynamic>?>, (String, int?)> {
  const WatchWeightsByPersonFamily._()
    : super(
        retry: null,
        name: r'watchWeightsByPersonProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchWeightsByPersonProvider call(String id, int? limit) =>
      WatchWeightsByPersonProvider._(argument: (id, limit), from: this);

  @override
  String toString() => r'watchWeightsByPersonProvider';
}
