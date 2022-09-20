import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/services/service_locator.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>()..add(LoginEvent()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  switch (state.loginState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      return Text(
                        statusModel != null
                            ? statusModel!.messageEn
                            : state.loginMessage,
                        style: const TextStyle(fontSize: 24),
                      );
                    case RequestState.error:
                      return Text(
                        statusModel != null
                            ? statusModel!.messageEn
                            : state.loginMessage,
                        style: const TextStyle(fontSize: 24),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
