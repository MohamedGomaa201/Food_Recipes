import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

class AttributesRow extends StatelessWidget {
  const AttributesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            AppImages.italyFlag,
            width: 25.w,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(8),
          child: Text("Vegetarian", style: Styles.tagAndCategoryStyle),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(8),
          child: Text("Meat,Casserole", style: Styles.tagAndCategoryStyle),
        ),
      ],
    );
  }
}
