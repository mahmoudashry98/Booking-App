import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';
import 'package:booking_app/app/booking/create_booking/domain/use_cases/create_booking_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class CreateBookingBaseRepository {
  Future<Either<dynamic, CreateBookingEntities>> CreateBooking(
      {required CreateBookingarameters parameters});
}
