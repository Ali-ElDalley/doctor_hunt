class AuthRequestModel {
  final String email;
  final String password;
  final Map<String, dynamic>? data;
  const AuthRequestModel({
    required this.email,
    required this.password,
     this.data,
  });
  Map<String, Object> toJson() {
    return {
      'email': email,
      'password': password,
      'data': ?data,
    };
  }
  factory AuthRequestModel.signUp({required String email, required String password, required String name}) {
    return AuthRequestModel(
      email: email,
      password: password,
      data: {'name': name},
    );
  }
}
