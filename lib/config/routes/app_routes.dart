import 'package:booking_app/app/auth/presentation/screens/login_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/profile_info_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/register_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/update_profile_screen.dart';

import '../../app/search/presentation/screens/search_screen.dart';

class AppRouts {
  static const String initialRoute = '/';
  static const String loginScreenRoute = '/loginScreen';
  static const String registerScreenRoute = '/registerScreen';
  static const String profileInfoScreenRoute = '/profileInfoScreen';
  static const String updateProfileInfoScreenRoute = '/updateProfileInfoScreen';
  static const String searchScreenRoute = '/searchScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const LoginScreen(),
  AppRouts.registerScreenRoute: (context) => const RegisterScreen(),
  AppRouts.profileInfoScreenRoute: (context) => const ProfileInfoScreen(),
  AppRouts.searchScreenRoute: (context) => const SearchScreen(),
  AppRouts.updateProfileInfoScreenRoute: (context) =>
      const UpdateProfileScreen()
};
