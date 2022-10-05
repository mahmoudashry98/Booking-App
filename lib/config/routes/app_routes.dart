import 'package:booking_app/app/auth/presentation/screens/login_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/profile_info_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/register_screen.dart';
import 'package:booking_app/app/auth/presentation/screens/update_profile_screen.dart';
import 'package:booking_app/app/search/presentation/screens/filter.dart';

import '../../app/search/domain/entities/search.dart';
import '../../app/search/presentation/screens/hotel_details.dart';
import '../../app/search/presentation/screens/search.dart';

class AppRouts {
 
  static const String initialRoute = '/';
  static const String loginScreenRoute = '/loginScreen';
  static const String registerScreenRoute = '/registerScreen';
  static const String profileInfoScreenRoute = '/profileInfoScreen';
  static const String updateProfileInfoScreenRoute = '/updateProfileInfoScreen';
  static const String searchScreenRoute = '/searchScreen';
  static const String filterScreenRoute = '/filterScreen';
  static const String hotelDetailsScreenRoute = '/hotelDetailsScreen';
}

final routes = {
  AppRouts.initialRoute: (context) => const LoginScreen(),
  AppRouts.registerScreenRoute: (context) => const RegisterScreen(),
  AppRouts.profileInfoScreenRoute: (context) => const ProfileInfoScreen(),
  AppRouts.searchScreenRoute: (context) => const SearchScreen(),
  AppRouts.filterScreenRoute: (context) => const FilterScreen(),
  //AppRouts.hotelDetailsScreenRoute: (context) => const HotelDetailsScreen(),
  AppRouts.updateProfileInfoScreenRoute: (context) =>
      const UpdateProfileScreen()
};
