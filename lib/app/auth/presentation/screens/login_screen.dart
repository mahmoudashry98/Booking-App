import 'package:booking_app/app/auth/presentation/controller/Auth_event.dart';
import 'package:booking_app/app/auth/presentation/controller/Auth_state.dart';
import 'package:booking_app/app/auth/presentation/controller/auth_bloc.dart';
import 'package:booking_app/app/search/presentation/controller/cubit.dart';

import 'package:booking_app/config/routes/app_routes.dart';
import 'package:booking_app/core/network/api_constance.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_theme_colors.dart';

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
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRouts.searchScreenRoute);
            },
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.red),
            ),
          ),
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
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: context.height * 0.06,
                      width: context.width * 0.77,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextField(
                          // controller: searchController,
                          onSubmitted: (String text) {},
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              color: AppColors.greyLight,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'London...',
                            contentPadding: const EdgeInsets.only(
                              left: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    // await SearchCubit.get(context).getSearchHotel(
                    //    //name: searchController.text,
                    //   // address: searchController.text,
                     
                    // );

                    Navigator.pushNamed(context, AppRouts.searchScreenRoute);
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.teal[400],
                    ),
                    child: Icon(
                      Icons.search,
                      size: 35,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
              ],
            ),
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
