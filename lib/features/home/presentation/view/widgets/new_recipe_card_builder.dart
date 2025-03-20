import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/new_recipe_card.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class NewRecipeCardBuilder extends StatelessWidget {
  const NewRecipeCardBuilder({super.key, required this.recipes});
  final List<RecipeModel> recipes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .30,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => NewRecipeCard(recipe: recipes[index]),
      ),
    );
  }
}
