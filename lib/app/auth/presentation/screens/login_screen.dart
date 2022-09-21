import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/config/routes/app_routes.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          TextButton(
              onPressed: () {
                authBloc.add(ProfileInfoEvent());
                Navigator.pushNamed(context, AppRouts.profileInfoScreenRoute);
              },
              child: const Text(
                'Profile Info',
                style: TextStyle(color: Colors.red),
              )),
          TextButton(
              onPressed: () {
                authBloc.add(UpdateProfileEvent());
                Navigator.pushNamed(
                    context, AppRouts.updateProfileInfoScreenRoute);
              },
              child: const Text(
                'update Profile Info',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AuthBloc, AuthState>(
              buildWhen: (previous, current) =>
                  previous.loginState != current.loginState,
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
    );
  }
}
