import 'package:booking_app/app/auth/domain/entities/login.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class AuthBaseRepository {
  Future<Either<dynamic, Login>> login({required LoginParameters parameters});
}
