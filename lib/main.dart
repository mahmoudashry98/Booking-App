import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/app/search/presentation/screens/search.dart';
import 'package:booking_app/bloc_observer.dart';

import 'package:booking_app/config/routes/app_routes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/search/presentation/controller/cubit.dart';
import 'config/services/service_locator.dart';

void main() {
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
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
          BlocProvider(
            create: (context) => sl<SearchCubit>()..getSearch(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: routes,
         //home: const SearchScreen(),
        )
        
        );
  }
}
