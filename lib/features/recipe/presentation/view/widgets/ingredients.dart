import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/ingredient_row.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.ingredients});
  final List<String> ingredients;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) => Text("$ingredients"),
        itemCount: ingredients.length,
        // children: [
        //   IngredientRow(ingredient: "Tomatoes", quantity: "500g"),
        //   IngredientRow(ingredient: "Cabbage", quantity: "300g"),
        //   IngredientRow(ingredient: "Taco", quantity: "300g"),
        //   IngredientRow(ingredient: "Slice Bread", quantity: "300g"),
        // ],
      ),
    );
  }
}
