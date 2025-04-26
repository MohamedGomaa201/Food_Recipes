import 'package:flutter/material.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/saved/data/favorites_provider.dart';
import 'package:provider/provider.dart';

class AddToFavoriteButton extends StatelessWidget {
  final RecipeModel recipe;
  const AddToFavoriteButton({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavoritesProvider>();
    final isFav = favs.isFavorite(recipe.id);

    return IconButton(
      icon: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        padding: EdgeInsets.all(8),
        child: Image.asset(
          isFav ? AppImages.navActBookmark : AppImages.navInActBookmark,
          scale: 1.3,
        ),
      ),
      onPressed: () async {
        await favs.toggleFavorite(recipe);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isFav ? 'Removed from favorites' : 'Added to favorites',
            ),
          ),
        );
      },
    );
  }
}
