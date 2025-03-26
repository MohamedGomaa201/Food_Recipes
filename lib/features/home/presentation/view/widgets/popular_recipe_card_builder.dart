import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/popular_recipe_card.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class PopularRecipeCardBuilder extends StatelessWidget {
  const PopularRecipeCardBuilder({super.key, required this.recipes});
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .27,
      child: ListView.builder(
        itemCount: recipes.length,
        itemBuilder:
            (context, index) => PopularRecipeCard(recipe: recipes[index]),
      ),
    );
  }
}
