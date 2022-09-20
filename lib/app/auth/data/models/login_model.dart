import 'package:booking_app/app/auth/domain/entities/login.dart';

class LoginModel extends Login {
  const LoginModel(
      {required super.id,
      required super.name,
      required super.apiToken,
      required super.email,
      required super.image});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        id: json['data']['id'],
        name: json['data']['name'],
        apiToken: json['data']['api_token'],
        email: json['data']['email'],
        image: json['data']['image']);
  }
}
