import 'package:booking_app/app/explore/domain/entities/hotel.dart';
import 'package:booking_app/app/search/domain/entities/search.dart';
import 'package:equatable/equatable.dart';
import 'package:booking_app/core/utils/request_state.dart';

class SearchState extends Equatable {
  final List<Search> search;
  final RequestState getSearchlState;
  final String getSearchMessage;

  const SearchState({
    this.search = const [],
    this.getSearchlState = RequestState.loading,
    this.getSearchMessage = '',
  });

  @override
  List<Object?> get props {
    return [
      search,
      getSearchlState,
      getSearchMessage,
    ];
  }

  SearchState copyWith({
    List<Search>? search,
    RequestState? getSearchlState,
    String? getSearchMessage,
  }) {
    return SearchState(
      search: search ?? this.search,
      getSearchlState: getSearchlState ?? this.getSearchlState,
      getSearchMessage: getSearchMessage ?? this.getSearchMessage,
    );
  }
}
