import 'package:booking_app/app/booking/create_booking/domain/entities/create_booking.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../base_repository/create_booking_base_repository.dart';

class CreateBookingCase
    extends BaseUseCase<CreateBookingEntities, CreateBookingarameters> {
  final CreateBookingBaseRepository baseRepository;

  CreateBookingCase({required this.baseRepository});
  @override
  Future<Either<dynamic, CreateBookingEntities>> call(
      CreateBookingarameters parameters) async {
    return await baseRepository.CreateBooking(parameters: parameters);
  }
}

class CreateBookingarameters extends Equatable {
  final String hotelId;

  const CreateBookingarameters({required this.hotelId});

  @override
  List<Object> get props => [hotelId];
}
