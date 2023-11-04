class UserRegistration {
  final String name;
  final String email;

  UserRegistration({
    required this.name,
    required this.email,
  });

  // Convert the object to a Map for sending to Firebase
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
