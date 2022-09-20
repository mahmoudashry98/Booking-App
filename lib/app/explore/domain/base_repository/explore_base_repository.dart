import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreBaseRepository {
  Future<Either<dynamic, List<Hotel>>> getHotels();
}
