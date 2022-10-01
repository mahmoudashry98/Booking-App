import 'package:booking_app/app/explore/domain/entities/hotel_data.dart';
import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_theme_colors.dart';
import '../../../../core/widgets/custom_text.dart';
// import '../widget/hotel_card.dart';

class BookHotelScreen extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;
  const BookHotelScreen({Key? key, required this.hotelDataEntities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var SearchController = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              // collapsedHeight: 150,
              backgroundColor: Colors.brown,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                    color: Colors.white,
                  )),
              expandedHeight: context.height * 1,
              toolbarHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                background: ImageWidget(
                    url:
                        'http://api.mahmoudtaha.com/images/${hotelDataEntities.images[0]}'),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  DetailsWidget(
                    hotelDataEntities: hotelDataEntities,
                  )
                  // ListView.separated(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemBuilder: (context, index) => DetailsWidget(),
                  //   separatorBuilder: (context, index) =>
                  //       const SizedBox(height: 16),
                  //   itemCount: 10,
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}

class DetailsWidget extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;

  const DetailsWidget({super.key, required this.hotelDataEntities});
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      iconColor: AppColors.kGreenColor,
      title: const Center(
        child: MoreDetailsText(),
      ),
      children: [
        MoreDetails(
          hotelDataEntities: hotelDataEntities,
        )
      ],
    );
  }
}

class MoreDetails extends StatelessWidget {
  final HotelDataEntities hotelDataEntities;

  const MoreDetails({super.key, required this.hotelDataEntities});
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    text: hotelDataEntities.name,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 16,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  width: context.width * .1,
                ),
                CustomText(
                  text: '\$${hotelDataEntities.price}',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  size: 18,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: context.width * .6,
                    child: CustomText(
                      text: hotelDataEntities.address,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      size: 14,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  width: context.width * .1,
                ),
                CustomText(
                  text: '/per night',
                  color: AppColors.greyLight,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.teal[400],
                ),
                CustomText(
                  text: '2.0Km to city',
                  color: AppColors.greyLight,
                  size: 14,
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Container(
        width: double.infinity,
        height: 1,
        color: AppColors.greyLight,
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Summary',
              color: AppColors.black,
              size: 20,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            CustomText(
              text: hotelDataEntities.description,
              color: AppColors.greyLight,
              size: 14,
              maxLines: 7,
              textOverflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: context.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.greyLight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        CustomText(
                          text: '9.5',
                          color: AppColors.kGreenColor,
                          size: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        CustomText(
                          text: 'Overall Rating',
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.height * .01,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: 'Room',
                              color: AppColors.black,
                              size: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Services',
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                              size: 16,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Location',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              size: 16,
                            ),
                            SizedBox(
                              height: context.height * .01,
                            ),
                            const CustomText(
                              text: 'Price',
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              size: 16,
                            ),
                            // SizedBox(
                            //   height: context.height * .01,
                            // ),
                          ],
                        ),
                        SizedBox(
                          width: context.width * .05,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.height * .01,
                              ),
                              Container(
                                width: context.width * .5,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .4,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .2,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                              Container(
                                width: context.width * .3,
                                height: 4,
                                color: AppColors.kGreenColor,
                              ),
                              SizedBox(
                                height: context.height * .03,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: context.height * .01,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          url,
          fit: BoxFit.cover,
          height: context.height * 1,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 500,
            start: 80,
            end: 20,
            // bottom: 80,
          ),
          child: Container(),
          //  HotelBookCard(
          //   hotel: Container(),
          // )
        ),
      ],
    );
  }
}

class MoreDetailsText extends StatelessWidget {
  const MoreDetailsText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * .3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: AppColors.greyLight),
      child: const Text(
        'More Details',
        style: TextStyle(color: AppColors.kGreyColor),
      ),
    );
  }
}
