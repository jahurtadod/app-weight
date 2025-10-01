import 'package:app_weight/config/providers/firebase_providers.dart';
import 'package:app_weight/user/data/datasource/user_datasource.dart';
import 'package:app_weight/user/data/datasource/user_datasource_impl.dart';
import 'package:app_weight/user/data/repositories/user_repository_impl.dart';
import 'package:app_weight/user/domain/entities/user.dart';
import 'package:app_weight/user/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
UserDatasource userRemoteDataSource(Ref ref) {
  final db = ref.watch(firestoreProvider);
  final auth = ref.watch(firebaseAuthProvider);
  return UserDatasourceImpl(db, auth);
}

@riverpod
UserRepository userReporitory(Ref ref) {
  final dataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(dataSource);
}

// Riverpod de la autenticacion
// UID actual o null
@riverpod
Stream<String?> authUid(Ref ref) {
  final repository = ref.watch(userReporitoryProvider);
  return repository.authStateChanges();
}

// Iniciar con Google
@riverpod
Future<User?> signInWithGoogle(Ref ref) async {
  final repository = ref.watch(userReporitoryProvider);
  return repository.signInWithGoogle();
}

// Cerrar sesión
@riverpod
Future<void> signOut(Ref ref) async {
  final repository = ref.watch(userReporitoryProvider);
  return repository.signOut();
}

// Traer usuario
@riverpod
Stream<User?> currentUser(Ref ref) {
  // final repository = ref.watch(userReporitoryProvider);
  // return repository.authStateChanges().asyncExpand((uid) {
  //   if (uid == null) return Stream.value(null);
  //   return repository.getUserById(uid);
  // });
  // 1) Observa el UID (AsyncValue<String?>)
  final uidAsync = ref.watch(authUidProvider);

  // 2) Según su estado, devuelve el stream correspondiente
  return uidAsync.when(
    data: (uid) {
      if (uid == null) return Stream.value(null);
      final repo = ref.read(
        userReporitoryProvider,
      ); // (mejor: userRepositoryProvider)
      return repo.getUserById(uid);
    },
    loading: () => const Stream.empty(),
    error: (_, __) => Stream.value(null),
  );
}

@riverpod
AsyncValue<String> currentUserFullName(Ref ref) {
  final asyncUser = ref.watch(currentUserProvider);
  return asyncUser.whenData((u) {
    if (u == null) return 'Invitado';
    final full = '${u.name} ${u.lastName}'.trim();
    return full.isEmpty ? u.email : full;
  });
}

@riverpod
AsyncValue<String> currentUserAvatarUrl(Ref ref) {
  final asyncUser = ref.watch(currentUserProvider);
  return asyncUser.whenData((u) => (u?.avatarUrl ?? '').trim());
}


// TODO Metodo del metodo de autentificacion
// LLAMAR AL REPOR E IMPLEMENTAR LA AUTENTICACION CON RIVERPOOD
