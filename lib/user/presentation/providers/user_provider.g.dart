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
    r'8cca7cb4f86f76c62b662ccb2c8c55a67b4c36be';

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

@ProviderFor(authUid)
const authUidProvider = AuthUidProvider._();

final class AuthUidProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  const AuthUidProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUidProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUidHash();

  @$internal
  @override
  $StreamProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String?> create(Ref ref) {
    return authUid(ref);
  }
}

String _$authUidHash() => r'fa4498d895f983aab03362cb2161fba7f946d3cf';

@ProviderFor(signInWithGoogle)
const signInWithGoogleProvider = SignInWithGoogleProvider._();

final class SignInWithGoogleProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, FutureOr<User?>>
    with $FutureModifier<User?>, $FutureProvider<User?> {
  const SignInWithGoogleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInWithGoogleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInWithGoogleHash();

  @$internal
  @override
  $FutureProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User?> create(Ref ref) {
    return signInWithGoogle(ref);
  }
}

String _$signInWithGoogleHash() => r'e2fffd59efc57f7e1cce2221e5d335dfffd394e3';

@ProviderFor(signOut)
const signOutProvider = SignOutProvider._();

final class SignOutProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const SignOutProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signOutProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signOutHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return signOut(ref);
  }
}

String _$signOutHash() => r'a59578188ba192879fccfb4accd7c3feae0c8863';

@ProviderFor(currentUser)
const currentUserProvider = CurrentUserProvider._();

final class CurrentUserProvider
    extends $FunctionalProvider<AsyncValue<User?>, User?, Stream<User?>>
    with $FutureModifier<User?>, $StreamProvider<User?> {
  const CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $StreamProviderElement<User?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<User?> create(Ref ref) {
    return currentUser(ref);
  }
}

String _$currentUserHash() => r'aa7f3fceff7f201d1de140f30a3346cc01b4bb60';

@ProviderFor(currentUserFullName)
const currentUserFullNameProvider = CurrentUserFullNameProvider._();

final class CurrentUserFullNameProvider
    extends
        $FunctionalProvider<
          AsyncValue<String>,
          AsyncValue<String>,
          AsyncValue<String>
        >
    with $Provider<AsyncValue<String>> {
  const CurrentUserFullNameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserFullNameProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserFullNameHash();

  @$internal
  @override
  $ProviderElement<AsyncValue<String>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AsyncValue<String> create(Ref ref) {
    return currentUserFullName(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<String>>(value),
    );
  }
}

String _$currentUserFullNameHash() =>
    r'26e4d7d602b8264ead9efcaf580cb79a3783bc2c';
