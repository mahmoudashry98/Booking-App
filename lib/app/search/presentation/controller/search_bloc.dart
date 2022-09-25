import 'package:booking_app/app/search/domain/usecase/get_search_usecase.dart';
import 'package:booking_app/app/search/presentation/controller/search_event.dart';
import 'package:booking_app/app/search/presentation/controller/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/network_exception.dart';
import '../../../../core/utils/request_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchUseCase getSearchUseCase;
  SearchBloc({
    required this.getSearchUseCase,
  }) : super(const SearchState()) {
    on<GetSearchEvent>(
      (event, emit) async {
        var response = await getSearchUseCase(
          const SearchParameters(
            name: 'Nasr Ciry Price 5000',
          ),
        );
        print(response);
        response.fold(
          (l) {
            print(NetworkExceptions.getErrorMessage(l));
            emit(
              state.copyWith(
                getSearchlState: RequestState.error,
                getSearchMessage: NetworkExceptions.getErrorMessage(l),
              ),
            );
          },
          (r) => emit(state.copyWith(
            search: r,
            getSearchlState: RequestState.loaded,
          )),
        );
      },
    );
  }

  Future getSearch() async {
    final result = await getSearchUseCase(
      const SearchParameters(
        name: 'With images',
      ),
    );
    print(result);
        result.fold(
          (l) {
            print(NetworkExceptions.getErrorMessage(l));
            emit(
              state.copyWith(
                getSearchlState: RequestState.error,
                getSearchMessage: NetworkExceptions.getErrorMessage(l),
              ),
            );
          },
          (r) => emit(state.copyWith(
            search: r,
            getSearchlState: RequestState.loaded,
          )),
        );
  }
}
