import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/styles.dart';

class NonClickableWithClickableText extends StatelessWidget {
  final String nonClickable;
  final String clickable;
  const NonClickableWithClickableText({
    super.key,
    required this.nonClickable,
    required this.clickable,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nonClickable,
          style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(width: 2.w),
        GestureDetector(
          onTap: () {},
          child: Text(
            clickable,
            style: Styles.textStyleSecColor13.copyWith(fontSize: 11.sp),
          ),
        ),
      ],
    );
  }
}