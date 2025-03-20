import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/add_to_favorite_button.dart';

class RecipeImage extends StatelessWidget {
  const RecipeImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 200.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(imageUrl, fit: BoxFit.cover),
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
        Positioned(bottom: 10.h, right: 7.w, child: AddToFavoriteButton()),
      ],
    );
  }
}
