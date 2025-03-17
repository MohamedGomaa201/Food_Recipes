import 'package:flutter/material.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_body.dart';

class RecipeView extends StatelessWidget {
  const RecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: RecipeBody());
  }
}
