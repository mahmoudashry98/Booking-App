import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../app/search/presentation/controller/cubit.dart';
import '../utils/app_theme_colors.dart';

class TextFromFieldWidget extends StatelessWidget {
  const TextFromFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchCubit = SearchCubit.get(context);
    TextEditingController searchController = TextEditingController();
    return Row(
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
                height: context.height * 1,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    // searchCubit.getSearch();
                  },
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
            // searchCubit.getSearch(
            //   name: searchController.text,
            // );

            searchController.text = '';
          },
          child: Container(
            height: context.height * 0.06,
            width: context.width * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
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
    );
  }
}
