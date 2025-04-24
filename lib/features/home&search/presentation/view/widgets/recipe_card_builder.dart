import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/home&search/presentation/view/widgets/recipe_card.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class RecipeCardBuilder extends StatelessWidget {
  final List<RecipeModel> recipes;
  const RecipeCardBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child:
          recipes.isEmpty
              ? Center(child: Text("No recipes found"))
              : ListView.builder(
                itemCount: recipes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) => RecipeCard(recipe: recipes[index]),
              ),
    );
  }
}
