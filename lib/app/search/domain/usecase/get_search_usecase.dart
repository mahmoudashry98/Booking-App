import 'package:dartz/dartz.dart';
import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/base_usecase/base_usecase.dart';
import '../base_repository/search_base_repository.dart';

class GetSearchUseCase extends BaseUseCase<List<Search>, SearchParameters> {
  final SearchBaseRepository baseSearchRepository;

  GetSearchUseCase({
    required this.baseSearchRepository,
  });

  @override
  Future<Either<dynamic, List<Search>>> call(
      SearchParameters parameters) async {
    return await baseSearchRepository.getSearch(parameters: parameters);
  }
}

class SearchParameters extends Equatable {
  final String? name;
  final String? address;

  const SearchParameters({
    this.name,
    this.address,
  });

  @override
  List<Object?> get props => [
        name,
        address,
      ];
}
