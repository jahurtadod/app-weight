import 'package:app_weight/weight/data/models/person_model.dart';

abstract class PersonDatasource {
  Future<PersonModel?> getPersonById(String id);
  // Future<List<Map<String, dynamic>>> getAllPersons();
  // Future<void> addPerson(Map<String, dynamic> person);
}
