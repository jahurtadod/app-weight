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
  return UserDatasourceImpl(db);
}

@riverpod
UserRepository userReporitory(Ref ref) {
  final dataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(dataSource);
}

@riverpod
Future<User?> userByEmailAuthentication(Ref ref, String email) async {
  final repository = ref.watch(userReporitoryProvider);
  return repository.authenticationUser(email);
}

// TODO Metodo del metodo de autentificacion
// LLAMAR AL REPOR E IMPLEMENTAR LA AUTENTICACION CON RIVERPOOD
