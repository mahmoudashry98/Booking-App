import 'package:booking_app/app/explore/data/data_source/explore_remote_data_source.dart';
import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:dartz/dartz.dart';

class ExploreRepository extends ExploreBaseRepository {
  final ExploreBaseRemoteDataSource baseRemoteDataSource;

  ExploreRepository(this.baseRemoteDataSource);
  @override
  Future<Either<dynamic, List<Hotel>>> getHotels() async {
    try {
      var response = await baseRemoteDataSource.getHotelDataSource();
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
