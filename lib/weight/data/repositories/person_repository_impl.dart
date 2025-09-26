import 'package:app_weight/weight/data/datasources/person_datasource.dart';
import 'package:app_weight/weight/domain/entities/person.dart';
import 'package:app_weight/weight/domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl(this._datasource);
  final PersonDatasource _datasource;

  @override
  Future<Person?> getPersonById(String id) {
    return _datasource.getPersonById(id).then((personModel) => personModel?.toEntity());
  }
  
  @override
  Stream<Person?> watchPersonById(String id) {
    return _datasource.watchPersonById(id).map((personModel) => personModel?.toEntity());
  }
  
}