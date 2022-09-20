import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:equatable/equatable.dart';
import 'package:booking_app/core/utils/request_state.dart';

class ExploreState extends Equatable {
  final List<Hotel> hotels;
  final RequestState getListHotelState;
  final String getListHotelMessage;

  const ExploreState({
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

  ExploreState copyWith({
    List<Hotel>? hotels,
    RequestState? getListHotelState,
    String? getListHotelMessage,
  }) {
    return ExploreState(
      hotels: hotels ?? this.hotels,
      getListHotelState: getListHotelState ?? this.getListHotelState,
      getListHotelMessage: getListHotelMessage ?? this.getListHotelMessage,
    );
  }
}
