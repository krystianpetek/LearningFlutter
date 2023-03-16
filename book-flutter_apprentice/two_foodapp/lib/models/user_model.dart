class UserModel {
  final String firstName;
  final String lastName;
  final String role;
  final String profileImageUrl;
  final int points;
  final bool darkMode;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.profileImageUrl,
    required this.points,
    required this.darkMode,
  });
}
