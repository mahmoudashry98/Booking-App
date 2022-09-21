import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final int id;
  final String name;
  final String apiToken;
  final String email;
  final String image;

  const Login({
    required this.id,
    required this.name,
    required this.apiToken,
    required this.email,
    required this.image,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      apiToken,
      email,
      image,
    ];
  }
}
