// class PersonRepositoryImpl implements PersonRepository {
//   PersonRepositoryImpl(this._datasource);
//   final PersonDatasource _datasource;

//   @override
//   Future<Person?> getPerson() async {
//     // Assuming there's a method to get the current user's ID
//     const userId = 'currentUserId'; // Replace with actual user ID retrieval logic
//     final personModel = await _datasource.getPersonById(userId);
//     return personModel?.toEntity();
//   }
// }