import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../base_repository/update_booking_base_repository.dart';
import '../entities/Update_booking.dart';

class CreateBookingCase
    extends BaseUseCase<UpdateBookingEntities, UpdateBookingarameters> {
  final UpdateBookingBaseRepository baseRepository;

  CreateBookingCase({required this.baseRepository});
  @override
  Future<Either<dynamic, UpdateBookingEntities>> call(
      UpdateBookingarameters parameters) async {
    return await baseRepository.UpdateBooking(parameters: parameters);
  }
}

class UpdateBookingarameters extends Equatable {
  final int bookingId;
  final String type;

  const UpdateBookingarameters({required this.type, required this.bookingId});

  @override
  List<Object> get props => [type, bookingId];
}
