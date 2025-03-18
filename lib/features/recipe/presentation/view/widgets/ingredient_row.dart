import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

class IngredientRow extends StatelessWidget {
  const IngredientRow({
    super.key,
    required this.ingredient,
    required this.quantity,
  });
  final String ingredient;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              shape: BoxShape.circle,
            ),
            width: 15.w,
            height: 15.h,
          ),
          SizedBox(width: 8.w),
          Text(
            ingredient,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            quantity,
            style: Styles.textStyleSecColor13.copyWith(color: AppColors.grey3),
          ),
        ],
      ),
    );
  }
}
