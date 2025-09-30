// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRemoteDataSource)
const userRemoteDataSourceProvider = UserRemoteDataSourceProvider._();

final class UserRemoteDataSourceProvider
    extends $FunctionalProvider<UserDatasource, UserDatasource, UserDatasource>
    with $Provider<UserDatasource> {
  const UserRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserDatasource create(Ref ref) {
    return userRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserDatasource>(value),
    );
  }
}

String _$userRemoteDataSourceHash() =>
    r'b559d891e7f017e9b23b6445a636bc4dbc0c0569';

@ProviderFor(userReporitory)
const userReporitoryProvider = UserReporitoryProvider._();

final class UserReporitoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserReporitoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userReporitoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userReporitoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userReporitory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userReporitoryHash() => r'c4f5bd038e75acfb53d12df95a91b03fcca6385b';

@ProviderFor(userByEmailAuthentication)
const userByEmailAuthenticationProvider = UserByEmailAuthenticationFamily._();

final class UserByEmailAuthenticationProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, FutureOr<User?>>
    with $FutureModifier<User?>, $FutureProvider<User?> {
  const UserByEmailAuthenticationProvider._({
    required UserByEmailAuthenticationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'userByEmailAuthenticationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userByEmailAuthenticationHash();

  @override
  String toString() {
    return r'userByEmailAuthenticationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User?> create(Ref ref) {
    final argument = this.argument as String;
    return userByEmailAuthentication(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserByEmailAuthenticationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userByEmailAuthenticationHash() =>
    r'e54379478614be4148a56b01ad76c3f9716fd2e7';

final class UserByEmailAuthenticationFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<User?>, String> {
  const UserByEmailAuthenticationFamily._()
    : super(
        retry: null,
        name: r'userByEmailAuthenticationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserByEmailAuthenticationProvider call(String email) =>
      UserByEmailAuthenticationProvider._(argument: email, from: this);

  @override
  String toString() => r'userByEmailAuthenticationProvider';
}
