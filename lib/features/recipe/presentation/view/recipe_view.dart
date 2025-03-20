import 'package:flutter/material.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_body.dart';

class RecipeView extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: RecipeBody(recipe: recipe));
  }
}
