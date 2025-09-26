class User {
  final String id;
  final String name;
  final String lastName;
  final String email;
  final String phoneNumber;
  final ROL role;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });
}

enum ROL { admin, manager, user }
