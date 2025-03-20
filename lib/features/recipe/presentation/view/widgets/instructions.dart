import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.instructions});
  final String instructions;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListView(
        children: [
          Text(
            instructions,
            style: TextStyle(fontSize: 14.sp),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
