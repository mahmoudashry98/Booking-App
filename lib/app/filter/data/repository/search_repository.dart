import 'package:booking_app/core/errors/network_exception.dart';
import 'package:dartz/dartz.dart';

import 'package:booking_app/app/explore/domain/entities/hotel.dart';

import '../../../explore/domain/base_repository/explore_base_repository.dart';
import '../../../explore/domain/use_cases/get_hotels_usecase.dart';
import '../data_source/search_remote_data_source.dart';

class SearchRepository extends ExploreBaseRepository {
  final SearchBaseRemoteDataSource baseRemoteDataSource;

  SearchRepository(this.baseRemoteDataSource);
  @override
  Future<Either<dynamic, List<Hotel>>> getHotels(
     {required HotelParameters parameters}
  ) async {
    try {
      var response = await baseRemoteDataSource.getSearchHotelDataSource();
      return Right(response);
    } catch (e) {
      return Left(NetworkExceptions.getDioException(e));
    }
  }
}
