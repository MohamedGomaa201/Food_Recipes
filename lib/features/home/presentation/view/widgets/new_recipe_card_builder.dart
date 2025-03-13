import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/new_recipe_card.dart';

class NewRecipeCardBuilder extends StatelessWidget {
  const NewRecipeCardBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .38,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => NewRecipeCard(),
      ),
    );
  }
}

