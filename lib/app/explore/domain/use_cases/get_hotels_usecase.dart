import 'package:booking_app/app/explore/domain/base_repository/explore_base_repository.dart';
import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/core/base_usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetHotelsUseCase extends BaseUseCase<List<Hotel>, NoParemeters> {
  final ExploreBaseRepository baseRepository;

  GetHotelsUseCase({required this.baseRepository});

  @override
  Future<Either<dynamic, List<Hotel>>> call(NoParemeters parameters) async {
    return await baseRepository.getHotels();
  }
}
