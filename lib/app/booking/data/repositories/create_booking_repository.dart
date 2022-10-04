import 'package:booking_app/app/booking/create_booking/domain/use_cases/create_booking_usecase.dart';
import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/network_exception.dart';
import '../../domain/base_repository/create_booking_base_repository.dart';
import '../data_source/create_booking_remote_data_source.dart';

class CreateBookingRepository extends CreateBookingBaseRepository {
  final CreateBookingBaseRemoteDataSource baseRemoteDataSource;

  CreateBookingRepository(this.baseRemoteDataSource);

  @override
  Future<Either<dynamic, CreateBookingEntities>> CreateBooking(
      {required CreateBookingarameters parameters}) async {
    try {
      var reponse = await baseRemoteDataSource.CreateBookingDataSource();
      return Right(reponse);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
