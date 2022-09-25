import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoScreen extends StatelessWidget {
  const ProfileInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('profileInfo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) =>
                    previous.profileInfoState != current.profileInfoState,
                builder: (context, state) {
                  switch (state.profileInfoState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      return Text(
                        statusProfileInfo != null
                            ? statusProfileInfo!.message
                            : state.profileInfoMessage,
                        style: const TextStyle(fontSize: 24),
                      );
                    case RequestState.error:
                      return Text(
                        statusProfileInfo != null
                            ? statusProfileInfo!.message
                            : state.profileInfoMessage,
                        style: const TextStyle(fontSize: 24),
                      );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
