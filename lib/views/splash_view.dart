import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/constants.dart';
import 'package:food_recipes/views/signin_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Image.asset("assets/icons/splash_logo.png"),
            SizedBox(height: 15.h),
            Text(
              "100K+ Premium Recipe ",
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            SizedBox(height: 60.h),
            SizedBox(
              width: 245.w,
              height: 55.h,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(mainColor),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninView()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Start Cooking",
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.arrow_forward, color: Colors.white, size: 18.sp),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
