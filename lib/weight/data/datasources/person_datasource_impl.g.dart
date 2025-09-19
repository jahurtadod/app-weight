// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_datasource_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personRemoteDataSource)
const personRemoteDataSourceProvider = PersonRemoteDataSourceProvider._();

final class PersonRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PersonDatasource,
          PersonDatasource,
          PersonDatasource
        >
    with $Provider<PersonDatasource> {
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
