import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: SizedBox(
        height: 231.h,
        width: 150.w,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 176.h,
              decoration: BoxDecoration(
                color: AppColors.grey4,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            Positioned(
              bottom: 75.h,
              child: Image.asset("assets/images/food1.png"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  SizedBox(height: 131.h),
                  Center(
                    child: Text(
                      "Classic Greek Salad",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 24.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/bookmark.png",
                        scale: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
