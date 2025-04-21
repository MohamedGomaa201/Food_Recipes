import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class HeadText extends StatelessWidget {
  const HeadText({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 17.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.mainColor,
      ),
    );
  }
}