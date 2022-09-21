import 'package:booking_app/app/auth/domain/entities/login.dart';

class ProileModel extends Login {
  ProileModel({
    required super.id,
    required super.name,
    required super.apiToken,
    required super.email,
    required super.image,
  });
}
