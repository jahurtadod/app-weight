// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_like_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLikeDatasource)
const userLikeDatasourceProvider = UserLikeDatasourceProvider._();

final class UserLikeDatasourceProvider
    extends
        $FunctionalProvider<
          UserLikeDatasource,
          UserLikeDatasource,
          UserLikeDatasource
        >
    with $Provider<UserLikeDatasource> {
  const UserLikeDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLikeDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLikeDatasourceHash();

  @$internal
  @override
  $ProviderElement<UserLikeDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLikeDatasource create(Ref ref) {
    return userLikeDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLikeDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLikeDatasource>(value),
    );
  }
}

String _$userLikeDatasourceHash() =>
    r'cf12b64d81df66c15e2115d8b17342d641617b30';

@ProviderFor(userLikeRepository)
const userLikeRepositoryProvider = UserLikeRepositoryProvider._();

final class UserLikeRepositoryProvider
    extends
        $FunctionalProvider<
          UserLikeRepository,
          UserLikeRepository,
          UserLikeRepository
        >
    with $Provider<UserLikeRepository> {
  const UserLikeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLikeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLikeRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserLikeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  UserLikeRepository create(Ref ref) {
    return userLikeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLikeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLikeRepository>(value),
    );
  }
}

String _$userLikeRepositoryHash() =>
    r'db82402853e230c51a6908840c8f7c31ae0c9784';

@ProviderFor(isLiked)
const isLikedProvider = IsLikedFamily._();

final class IsLikedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsLikedProvider._({
    required IsLikedFamily super.from,
    required (LikeTargetType, String) super.argument,
  }) : super(
         retry: null,
         name: r'isLikedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isLikedHash();

  @override
  String toString() {
    return r'isLikedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    final argument = this.argument as (LikeTargetType, String);
    return isLiked(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is IsLikedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isLikedHash() => r'f4bfdf086b836ef4c696654047a9d48a68017e5c';

final class IsLikedFamily extends $Family
    with $FunctionalFamilyOverride<Stream<bool>, (LikeTargetType, String)> {
  const IsLikedFamily._()
    : super(
        retry: null,
        name: r'isLikedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsLikedProvider call(LikeTargetType type, String targetId) =>
      IsLikedProvider._(argument: (type, targetId), from: this);

  @override
  String toString() => r'isLikedProvider';
}

@ProviderFor(toggleLike)
const toggleLikeProvider = ToggleLikeFamily._();

final class ToggleLikeProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const ToggleLikeProvider._({
    required ToggleLikeFamily super.from,
    required (LikeTargetType, String) super.argument,
  }) : super(
         retry: null,
         name: r'toggleLikeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$toggleLikeHash();

  @override
  String toString() {
    return r'toggleLikeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (LikeTargetType, String);
    return toggleLike(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is ToggleLikeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$toggleLikeHash() => r'41cc276e4f3ac53fe166a3fc5da7fc6d0c22d33a';

final class ToggleLikeFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, (LikeTargetType, String)> {
  const ToggleLikeFamily._()
    : super(
        retry: null,
        name: r'toggleLikeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ToggleLikeProvider call(LikeTargetType type, String targetId) =>
      ToggleLikeProvider._(argument: (type, targetId), from: this);

  @override
  String toString() => r'toggleLikeProvider';
}
