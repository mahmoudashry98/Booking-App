import 'package:booking_app/app/explore/domain/use_cases/get_hotels_usecase.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_event.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_state.dart';
import 'package:booking_app/core/errors/network_exception.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final GetHotelsUseCase getHotelsUseCase;
  ExploreBloc({
    required this.getHotelsUseCase,
  }) : super(const ExploreState()) {
    on<GetHotelsEvent>((event, emit) async {
      var response = await getHotelsUseCase(
        const HotelParameters(
          //ToDo here give the parameters depend on call
          count: 4,
        ),
      );
     // print(response);
      response.fold((l) {
        //(NetworkExceptions.getErrorMessage(l));
        emit(state.copyWith(
            getListHotelState: RequestState.error,
            getListHotelMessage: NetworkExceptions.getErrorMessage(l)));
      },
          (r) => emit(state.copyWith(
              hotels: r, getListHotelState: RequestState.loaded)));
    });
  }
}
