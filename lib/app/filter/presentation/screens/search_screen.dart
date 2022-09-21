import 'package:booking_app/app/explore/presentation/controller/explore_bloc.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_event.dart';
import 'package:booking_app/app/explore/presentation/controller/explore_state.dart';
import 'package:booking_app/config/routes/app_routes.dart';
import 'package:booking_app/core/services/service_locator.dart';
import 'package:booking_app/core/utils/request_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouts.loginScreenRoute);
              },
              child: const Text('go'))
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<ExploreBloc>()..add(GetHotelsEvent()),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  print(state.hotels.length);
                  switch (state.getListHotelState) {
                    case RequestState.loading:
                      return const Center(child: CircularProgressIndicator());
                    case RequestState.loaded:
                      return Text(
                        state.hotels[0].name,
                        style: const TextStyle(fontSize: 24),
                      );
                    case RequestState.error:
                      return Text(
                        state.getListHotelMessage.toString(),
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
