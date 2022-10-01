import 'package:booking_app/app/booking/presentation/cubit/booking_cubit.dart';
import 'package:booking_app/app/booking/presentation/cubit/booking_state.dart';
import 'package:booking_app/core/utils/app_theme_colors.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:booking_app/core/widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class UpCommingScreen extends StatelessWidget {
  const UpCommingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        var cubit = BookingCubit.get(context);

        return Container(
          width: context.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ListView.separated(
            padding: EdgeInsets.only(top: 3.h),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  height: context.height * 0.36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: context.height * 0.22,
                        width: context.width * 0.92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: CachedNetworkImage(
                            imageUrl:
                                'http://api.mahmoudtaha.com/images/${cubit.listGetBooking[index].hotelImages[0].image}',
                            height: context.height * 0.22,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.teal[400],
                                    strokeWidth: 5,
                                  )),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomText(
                                text: cubit.listGetBooking[index].hotelName,
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                size: 20,
                                // textOverflow: TextOverflow.,
                                maxLines: 1,
                              ),
                            ),
                            const Spacer(),
                            CustomText(
                              text: cubit.listGetBooking[index].hotelPrice,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CustomText(
                                text: '2.0Km to city',
                                color: AppColors.greyLight,
                                size: 14,
                                maxLines: 2,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(
                              Icons.location_on,
                              color: Colors.teal[400],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 5,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 22,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.teal[400],
                              ),
                              onRatingUpdate: (rating) {},
                            ),
                            CustomText(
                              text: ' 80Reviews',
                              color: AppColors.greyLight,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: cubit.listGetBooking.length,
          ),
        );
      },
    );
  }
}
