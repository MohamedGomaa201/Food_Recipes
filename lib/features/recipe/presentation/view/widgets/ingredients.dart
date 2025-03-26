import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/ingredient_row.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    super.key,
    required this.ingredients,
    required this.measures,
  });
  final List<String> ingredients;
  final List<String> measures;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder:
            (context, index) => IngredientRow(
              ingredient: ingredients[index],
              quantity: measures[index],
            ),
        itemCount: ingredients.length,
      ),
    );
  }
}
