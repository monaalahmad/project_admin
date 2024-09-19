class LoginModel {
  final bool success;
  final String message;
  final String token;
  final String role;

  LoginModel(
      {required this.role, required this.success, required this.message, required this.token});

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      success: jsonData['success'],
      message: jsonData['message'],
      token: jsonData['data']['token'],
      role: jsonData['data']['role'],
    );
  }
}
