import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset("assets/images/food2.jpg", fit: BoxFit.cover),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              begin: FractionalOffset.center,
              end: FractionalOffset.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
            ),
          ),
          width: double.infinity,
          height: 200.h,
        ),
        Positioned(
          bottom: 10.h,
          right: 7.w,
          child: IconButton(
            onPressed: () {},
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8),
              child: Image.asset(AppImages.addToFavorite, scale: 1.3),
            ),
          ),
        ),
      ],
    );
  }
}
