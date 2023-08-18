class UserModel {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userName: json['user_name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'user_name': userName,
      'email': email,
    };
  }
}
