import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, this.onSubmitted, this.onTap});
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: onTap != null,
      onTap: onTap,
      cursorColor: AppColors.mainColor,
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        prefixIcon: Image.asset(AppImages.searchIcon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey4),
          borderRadius: BorderRadius.circular(10.sp),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: AppColors.grey4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        hintText: "Search or pick a category",
        hintStyle: Styles.textStyleGrey11,
      ),
    );
  }
}
