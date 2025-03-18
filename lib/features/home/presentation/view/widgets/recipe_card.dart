import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

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
              child: Image.asset(
                "assets/images/food1.png",
                width: 155.w,
                height: 155.h,
              ),
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
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AppImages.addToFavorite,
                              scale: 1.5,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeView(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.grey3,
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: 7.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
