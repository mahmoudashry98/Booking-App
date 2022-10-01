import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'dart:math' as math;
import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../domain/entities/hotel_data.dart';

class CardExploreWidget extends StatelessWidget {
  const CardExploreWidget({Key? key, this.hotel}) : super(key: key);
  final HotelDataEntities? hotel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 2.h, bottom: 1.h, end: 2.h),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2.h),
          ),
        ),
        child: Row(
          children: [
            Container(
              height: 20.h,
              width: 33.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2.h),
                  bottomLeft: Radius.circular(2.h),
                ),
                child: Image.network(
                  'http://api.mahmoudtaha.com/images/${hotel!.images[math.Random().nextInt(hotel!.images.length)]}',
                  fit: BoxFit.cover,
                  height: 20.h,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: hotel!.name,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      size: 12.sp,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 0.5.h),
                    CustomText(
                      text: hotel!.address,
                      color: AppColors.greyLight,
                      size: 10.sp,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.teal[400],
                                ),
                                CustomText(
                                  text: '2.0Km to city',
                                  color: AppColors.greyLight,
                                  size: 10.sp,
                                ),
                              ],
                            ),
                            RatingBar.builder(
                              initialRating: double.parse(hotel!.rate),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 4.w,
                              // itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.teal[400],
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CustomText(
                                text: '\$${hotel!.price}',
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                size: 12.sp,
                              ),
                              CustomText(
                                text: '/per night',
                                color: AppColors.greyLight,
                                size: 10.sp,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
