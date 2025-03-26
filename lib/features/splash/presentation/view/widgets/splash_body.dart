import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/auth/presentation/view/signin_view.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.splashBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 100.h),
          Image.asset(AppImages.splashLogo),
          SizedBox(height: 15.h),
          Text(
            "100K+ Premium Recipe ",
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 225.h),
          Text(
            "Get\nCooking",
            style: TextStyle(
              color: Colors.white,
              fontSize: 45.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25.h),
          Text(
            "Simple way to find Tasty Recipe",
            style: Styles.textStyle18.copyWith(fontSize: 15.sp),
          ),
          SizedBox(height: 60.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            child: CustomAppButton(
              text: "Start Cooking",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninView()),
                );
              },
              height: 55,
            ),
          ),
        ],
      ),
    );
  }
}
