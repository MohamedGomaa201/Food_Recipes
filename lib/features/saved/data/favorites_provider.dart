// features/saved/data/favorites_provider.dart
import 'package:flutter/foundation.dart';
import 'package:food_recipes/core/database/favorites_repository.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final FavoritesRepository _repo;
  List<RecipeModel> _favorites = [];

  FavoritesProvider({required String userId})
    : _repo = FavoritesRepository(userId: userId) {
    _load();
  }

  List<RecipeModel> get favorites => _favorites;
  bool isFavorite(String id) => _favorites.any((r) => r.id == id);

  Future<void> _load() async {
    _favorites = await _repo.getFavorites();
    notifyListeners();
  }

  Future<void> toggleFavorite(RecipeModel recipe) async {
    await _repo.toggleFavorite(recipe);
    await _load();
  }
}
