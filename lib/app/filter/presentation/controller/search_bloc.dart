import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/app/filter/presentation/controller/search_event.dart';
import 'package:booking_app/app/filter/presentation/controller/search_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/network_exception.dart';
import '../../../../core/utils/request_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  static SearchBloc get(context) => BlocProvider.of(context);
  final GetHotelsUseCase getHotelsUseCase;
  SearchBloc({
    required this.getHotelsUseCase,
  }) : super(const SearchState()){
    on<GetSearchHotelsEvent>((event, emit) async {
      
      TextEditingController searchController = TextEditingController();
      var response = await getHotelsUseCase(
        const HotelParameters(
          //ToDo here give the parameters depend on call
          name: 'Nasr Cirt',
          address: 'rome',
          
        ),
      );

      print(response);
      response.fold(
        (l) {
          print(NetworkExceptions.getErrorMessage(l));
          emit(state.copyWith(
              getListHotelState: RequestState.error,
              getListHotelMessage: NetworkExceptions.getErrorMessage(l)));
        },
        (r) => emit(
          state.copyWith(hotels: r, getListHotelState: RequestState.loaded),
        ),
      );
    });
  }
}
