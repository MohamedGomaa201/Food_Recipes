import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String aboveHint;
  final String hintText;
  const CustomTextField({
    super.key,
    required this.aboveHint,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(aboveHint),
        SizedBox(height: 5.h),
        TextField(
          cursorColor: AppColors.mainColor,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.sp),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide(color: AppColors.mainColor),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 11.sp),
          ),
        ),
      ],
    );
  }
}
