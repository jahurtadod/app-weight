// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(participantRemoteDataSource)
const participantRemoteDataSourceProvider =
    ParticipantRemoteDataSourceProvider._();

final class ParticipantRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ParticipantDatasource,
          ParticipantDatasource,
          ParticipantDatasource
        >
    with $Provider<ParticipantDatasource> {
  const ParticipantRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'participantRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$participantRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ParticipantDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ParticipantDatasource create(Ref ref) {
    return participantRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParticipantDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParticipantDatasource>(value),
    );
  }
}

String _$participantRemoteDataSourceHash() =>
    r'52eefe34fd65b8ef6c9ce5d2cb4a1f704287fd9f';

@ProviderFor(participantRepository)
const participantRepositoryProvider = ParticipantRepositoryProvider._();

final class ParticipantRepositoryProvider
    extends
        $FunctionalProvider<
          ParticipantsRepository,
          ParticipantsRepository,
          ParticipantsRepository
        >
    with $Provider<ParticipantsRepository> {
  const ParticipantRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'participantRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$participantRepositoryHash();

  @$internal
  @override
  $ProviderElement<ParticipantsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ParticipantsRepository create(Ref ref) {
    return participantRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParticipantsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParticipantsRepository>(value),
    );
  }
}

String _$participantRepositoryHash() =>
    r'21d2cabda6ad7fd02d2f79b57d6b8b2c66aedf01';

@ProviderFor(participantAll)
const participantAllProvider = ParticipantAllFamily._();

final class ParticipantAllProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Participant>?>,
          List<Participant>?,
          FutureOr<List<Participant>?>
        >
    with
        $FutureModifier<List<Participant>?>,
        $FutureProvider<List<Participant>?> {
  const ParticipantAllProvider._({
    required ParticipantAllFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'participantAllProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$participantAllHash();

  @override
  String toString() {
    return r'participantAllProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Participant>?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Participant>?> create(Ref ref) {
    final argument = this.argument as String;
    return participantAll(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ParticipantAllProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$participantAllHash() => r'bc2fbea9f67be74e9f8bb207367fc43a86b32dc7';

final class ParticipantAllFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Participant>?>, String> {
  const ParticipantAllFamily._()
    : super(
        retry: null,
        name: r'participantAllProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ParticipantAllProvider call(String betId) =>
      ParticipantAllProvider._(argument: betId, from: this);

  @override
  String toString() => r'participantAllProvider';
}
