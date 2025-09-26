
import 'package:app_weight/weight/domain/entities/person.dart';

abstract class PersonRepository {
  Future<Person?> getPersonById(String id);
  Stream<Person?> watchPersonById(String id);
}