import 'package:booking_app/app/search/presentation/controller/search_bloc.dart';
import 'package:booking_app/app/search/presentation/controller/search_state.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/request_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: () {
              searchBloc.getSearch();
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                print(state.search.length);
                switch (state.getSearchlState) {
                  case RequestState.loading:
                    return const Center(child: CircularProgressIndicator());
                  case RequestState.loaded:
                    return Column(
                      children: [
                        Container(
                          height: context.height * 0.1,
                          width: context.width,
                          child: ListView.builder(
                            itemBuilder: (context, index) => Center(
                              child: Text(
                                state.search[index].name,
                              ),
                            ),
                            itemCount: state.search.length,
                          ),
                        ),
                        Text(
                          '${state.search.length}',
                        ),
                      ],
                    );
                  case RequestState.error:
                    return Text(
                      state.getSearchMessage.toString(),
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
