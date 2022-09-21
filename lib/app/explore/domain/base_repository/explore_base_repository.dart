import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreBaseRepository {
  Future<Either<dynamic, List<Hotel>>> getHotels({required HotelParameters parameters});
}
