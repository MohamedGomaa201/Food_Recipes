import 'package:food_recipes/features/recipe/data/models/category_model.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

import '../services/api_service.dart';

class RecipeService {
  final ApiService _apiService = ApiService();

  /// Fetch a random recipe
  Future<RecipeModel?> getRandomRecipe() async {
    final data = await _apiService.getRequest("random.php");
    if (data != null && data['meals'] != null) {
      return RecipeModel.fromJson(data['meals'][0]);
    }
    return null;
  }

  /// Search recipes by name
  Future<List<RecipeModel>> searchRecipes(String query) async {
    final data = await _apiService.getRequest(
      "search.php",
      params: {"s": query},
    );
    if (data != null && data['meals'] != null) {
      return (data['meals'] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
    }
    return [];
  }

  /// Filter recipes by area (country)
  Future<List<RecipeModel>> filterByArea(String area) async {
    final data = await _apiService.getRequest(
      "filter.php",
      params: {"a": area},
    );
    if (data != null && data['meals'] != null) {
      return (data['meals'] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
    }
    return [];
  }

  /// Filter recipes by category
  Future<List<RecipeModel>> filterByCategory(String category) async {
    final data = await _apiService.getRequest(
      "filter.php",
      params: {"c": category},
    );
    if (data != null && data['meals'] != null) {
      return (data['meals'] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
    }
    return [];
  }

  /// Fetch all categories (name + thumbnail + description)
  Future<List<CategoryModel>> getCategories() async {
    final data = await _apiService.getRequest("categories.php");
    if (data != null && data['categories'] != null) {
      return (data['categories'] as List)
          .map((c) => CategoryModel.fromJson(c))
          .toList();
    }
    return [];
  }

  /// Get full recipe details by ID
  Future<RecipeModel?> getRecipeDetails(String id) async {
    final data = await _apiService.getRequest("lookup.php", params: {"i": id});
    if (data != null && data['meals'] != null) {
      return RecipeModel.fromJson(data['meals'][0]);
    }
    return null;
  }
}
