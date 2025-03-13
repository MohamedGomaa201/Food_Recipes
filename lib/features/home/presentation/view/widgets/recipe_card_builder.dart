import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/recipe_card.dart';

class RecipeCardBuilder extends StatelessWidget {
  const RecipeCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 231.h,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecipeCard(),
      ),
    );
  }
}