import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/config/routes/app_routes.dart';
import 'package:booking_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>()..add(LoginEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Booking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
      ),
    );
  }
}
