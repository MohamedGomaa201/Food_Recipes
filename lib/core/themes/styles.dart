import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

abstract class Styles {
  static TextStyle textStyleGrey11 = TextStyle(
    color: AppColors.grey4,
    fontSize: 11.sp,
  );

  static TextStyle textStyleGrey12 = TextStyle(
    color: Colors.grey,
    fontSize: 12.sp,
  );

  static TextStyle textStyleSecColor13 = TextStyle(
    color: Color.fromRGBO(255, 156, 0, 1),
    fontSize: 13.sp,
  );

  static TextStyle textStyle18 = TextStyle(
    color: Colors.white,
    fontSize: 18.sp,
  );

  static TextStyle tagAndCategoryStyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
  );
}
