// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider del DataSource (inyecta FirebaseFirestore)

@ProviderFor(personRemoteDataSource)
const personRemoteDataSourceProvider = PersonRemoteDataSourceProvider._();

/// Provider del DataSource (inyecta FirebaseFirestore)

final class PersonRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PersonDatasource,
          PersonDatasource,
          PersonDatasource
        >
    with $Provider<PersonDatasource> {
  /// Provider del DataSource (inyecta FirebaseFirestore)
  const PersonRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PersonDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PersonDatasource create(Ref ref) {
    return personRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonDatasource>(value),
    );
  }
}

String _$personRemoteDataSourceHash() =>
    r'6162e89f54416fe751580c34225daddd47fa4a93';

/// Provider del Repository (inyecta el DataSource)

@ProviderFor(personRepository)
const personRepositoryProvider = PersonRepositoryProvider._();

/// Provider del Repository (inyecta el DataSource)

final class PersonRepositoryProvider
    extends
        $FunctionalProvider<
          PersonRepository,
          PersonRepository,
          PersonRepository
        >
    with $Provider<PersonRepository> {
  /// Provider del Repository (inyecta el DataSource)
  const PersonRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personRepositoryHash();

  @$internal
  @override
  $ProviderElement<PersonRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PersonRepository create(Ref ref) {
    return personRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonRepository>(value),
    );
  }
}

String _$personRepositoryHash() => r'e7cbf08e717b647eb8d3be72fa8da30e69b9a796';

/// “Query” para leer una persona por id (sin casos de uso)

@ProviderFor(personById)
const personByIdProvider = PersonByIdFamily._();

/// “Query” para leer una persona por id (sin casos de uso)

final class PersonByIdProvider
    extends $FunctionalProvider<AsyncValue<Person?>, Person?, FutureOr<Person?>>
    with $FutureModifier<Person?>, $FutureProvider<Person?> {
  /// “Query” para leer una persona por id (sin casos de uso)
  const PersonByIdProvider._({
    required PersonByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'personByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$personByIdHash();

  @override
  String toString() {
    return r'personByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Person?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Person?> create(Ref ref) {
    final argument = this.argument as String;
    return personById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PersonByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$personByIdHash() => r'3c7cd7bc6bccc0a2dae5e98476548476f332ca25';

/// “Query” para leer una persona por id (sin casos de uso)

final class PersonByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Person?>, String> {
  const PersonByIdFamily._()
    : super(
        retry: null,
        name: r'personByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// “Query” para leer una persona por id (sin casos de uso)

  PersonByIdProvider call(String id) =>
      PersonByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'personByIdProvider';
}

/// Tiempo real (este es el que necesitas)

@ProviderFor(watchPersonById)
const watchPersonByIdProvider = WatchPersonByIdFamily._();

/// Tiempo real (este es el que necesitas)

final class WatchPersonByIdProvider
    extends $FunctionalProvider<AsyncValue<Person?>, Person?, Stream<Person?>>
    with $FutureModifier<Person?>, $StreamProvider<Person?> {
  /// Tiempo real (este es el que necesitas)
  const WatchPersonByIdProvider._({
    required WatchPersonByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'watchPersonByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchPersonByIdHash();

  @override
  String toString() {
    return r'watchPersonByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Person?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Person?> create(Ref ref) {
    final argument = this.argument as String;
    return watchPersonById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchPersonByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchPersonByIdHash() => r'24836e48a0a1bd95b0a623fa7721f8d2c9f6d5ac';

/// Tiempo real (este es el que necesitas)

final class WatchPersonByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Person?>, String> {
  const WatchPersonByIdFamily._()
    : super(
        retry: null,
        name: r'watchPersonByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Tiempo real (este es el que necesitas)

  WatchPersonByIdProvider call(String id) =>
      WatchPersonByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'watchPersonByIdProvider';
}
