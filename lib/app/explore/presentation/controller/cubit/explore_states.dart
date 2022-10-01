abstract class ExploreState {}

class InitialExploreState extends ExploreState {}

class ExploreLoadingState extends ExploreState {}

class ExploreLoadedState extends ExploreState {}

class ExploreErrorState extends ExploreState {
  final String message;

  ExploreErrorState({required this.message});
}

class ChangeBottomNavBar extends ExploreState {}
