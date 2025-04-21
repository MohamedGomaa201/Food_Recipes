import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            child: CircleAvatar(
              radius: 50.r,
              backgroundImage: AssetImage(AppImages.profileScreenIcon),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            user.displayName ?? "Jamie Oliver",
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.mainColor,
            ),
          ),
          Text(
            user.email ?? "test@mail.com",
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.grey3,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
