import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

class TextInsideDivider extends StatelessWidget {
  final String text;
  const TextInsideDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: AppColors.grey4, thickness: .5.h)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              text,
              style: Styles.textStyleGrey12.copyWith(color: AppColors.grey4),
            ),
          ),
          Expanded(child: Divider(color: AppColors.grey4, thickness: .5.h)),
        ],
      ),
    );
  }
}
