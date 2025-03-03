import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class CustomAppButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final int height;
  const CustomAppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
          ),
          backgroundColor: WidgetStatePropertyAll(AppColors.mainColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(color: Colors.white, fontSize: 16.sp)),
            SizedBox(width: 25.w),
            Icon(Icons.arrow_forward, color: Colors.white, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
