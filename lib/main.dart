import 'package:booking_app/app/explore/presentation/screens/explore_screen.dart';
import 'package:booking_app/config/routes/app_routes.dart';
import 'package:booking_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'app/filter/presentation/screens/search_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: routes,
      home: const SearchScreen(),
    );
  }
}
