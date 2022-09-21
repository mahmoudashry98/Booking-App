import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetHotelsUseCase extends BaseUseCase<List<Hotel>, HotelParameters> {
  final ExploreBaseRepository baseRepository;

  GetHotelsUseCase({required this.baseRepository});

  @override
  Future<Either<dynamic, List<Hotel>>> call(HotelParameters parameters) async {
    return await baseRepository.getHotels(parameters:parameters);
  }
}

class HotelParameters extends Equatable {
  final int? count;
  final String? name;
  final String? address;
  final String? maxPrice;
  final String? minPrice;
  final String? lat;
  final String? log;
  final String? distance;

  const HotelParameters(
    {
    this.count,
    this.name,
    this.address,
    this.maxPrice,
    this.minPrice,
    this.lat,
    this.log,
    this.distance,
    }
  );

  @override
  List<Object?> get props => [
    count,
    name,
    address,
    maxPrice,
    minPrice,
    lat,
    log,
    distance
  ];
}
