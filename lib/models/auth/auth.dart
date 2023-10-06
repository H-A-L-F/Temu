class Auth {
  final String password;
  final String? phoneNumber;
  final String email;

  Auth({
    required this.password,
    this.phoneNumber,
    required this.email,
  });

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      email: json['email'] ?? '',
      password: json['password'],
      phoneNumber: json['phoneNumber'] ?? '',
    );
  }
}
