import 'package:booking_app/app/auth/presentation/screens/login_screen.dart';
import 'package:booking_app/app/explore/presentation/screens/explore_screen.dart';

class AppRouts {
  static const String initialRoute = '/';
  static const String loginScreenRoute = '/loginScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const ExploreScreen(),
  AppRouts.loginScreenRoute: (context) => const LoginScreen()
  // AppRouts.searchScreen: (context) => const SearchScreen(),
};
