import 'package:equatable/equatable.dart';

import '../../../../core/utils/request_state.dart';
import '../../../explore/domain/entities/hotel.dart';

class SearchState extends Equatable {
  final List<Hotel> hotels;
  final RequestState getListHotelState;
  final String getListHotelMessage;

  const SearchState({
    this.hotels = const [],
    this.getListHotelState = RequestState.loading,
    this.getListHotelMessage = '',
  });

  @override
  List<Object?> get props {
    return [
      hotels,
      getListHotelState,
      getListHotelMessage,
    ];
  }


    SearchState copyWith({
    List<Hotel>? hotels,
    RequestState? getListHotelState,
    String? getListHotelMessage,
  }) {
    return SearchState(
      hotels: hotels ?? this.hotels,
      getListHotelState: getListHotelState ?? this.getListHotelState,
      getListHotelMessage: getListHotelMessage ?? this.getListHotelMessage,
    );
  }
}



