import 'package:flutter/material.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';
import 'package:food_recipes/features/saved/data/favorites_provider.dart';
import 'package:provider/provider.dart';

class SavedBody extends StatelessWidget {
  const SavedBody({super.key});

  @override
  Widget build(BuildContext context) {
    final favs = context.watch<FavoritesProvider>();
    final list = favs.favorites;

    if (list.isEmpty) {
      return const Center(child: Text("You haven’t saved any recipes yet."));
    }
    return ListView.separated(
      itemCount: list.length,
      separatorBuilder: (context, i) => const Divider(),
      itemBuilder: (context, i) {
        final r = list[i];
        return ListTile(
          leading: Image.network(
            r.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          title: Text(r.name),
          subtitle: Text(r.category),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => favs.toggleFavorite(r),
          ),
          onTap:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeView(recipe: r)),
              ),
        );
      },
    );
  }
}
