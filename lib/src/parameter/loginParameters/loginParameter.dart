class loginParameter {
  final String username;
  final String email;
  final String password;

  const loginParameter({
    required this.username,
    required this.email,
    required this.password,
  });

  factory loginParameter.fromJson(Map<String, dynamic> json) {
    return loginParameter(
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }
}
