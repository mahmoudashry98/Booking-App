import 'package:booking_app/app/auth/data/data_source/auth_remote_data_source.dart';
import 'package:booking_app/app/auth/domain/base_repository/auth_base_repository.dart';
import 'package:booking_app/app/auth/domain/entities/login.dart';
import 'package:booking_app/app/auth/domain/use_cases/login_usecase.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:dartz/dartz.dart';

class AuthRepository extends AuthBaseRepository {
  final AuthBaseRemoteDataSource baseRemoteDataSource;

  AuthRepository(this.baseRemoteDataSource);
  @override
  Future<Either<dynamic, Login>> login(
      {required LoginParameters parameters}) async {
    try {
      var reponse =
          await baseRemoteDataSource.postLogin(loginParameters: parameters);
      return Right(reponse);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
