import 'package:booking_app/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

import '../utils/app_theme_colors.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? left;
  final double? right;
  final double? top;
  final double? bottom;
  const CustomButton({
    Key? key,
    required this.text,
    this.bottom,
    this.height,
    this.left,
    this.right,
    this.top,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * height!,
      child: Padding(
        padding: EdgeInsets.only(
          left: left!,
          right: right!,
          top: top!,
          bottom: bottom!,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.teal[400],
          ),
          child: Center(
            child: CustomText(
              text: text,
              color: AppColors.kwhite,
            ),
          ),
        ),
      ),
    );
  }
}
