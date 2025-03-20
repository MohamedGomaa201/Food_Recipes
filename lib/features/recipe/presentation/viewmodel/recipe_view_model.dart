import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class RecipeViewModel {
  final RecipeService _recipeService = RecipeService();

  Future<RecipeModel?> fetchRandomRecipe() async {
    return await _recipeService.getRandomRecipe();
  }

  Future<List<RecipeModel>> searchRecipes(String query) async {
    return await _recipeService.searchRecipes(query);
  }

  Future<List<RecipeModel>> filterByArea(String area) async {
    return await _recipeService.filterByArea(area);
  }

  Future<RecipeModel?> fetchRecipeById(String id) async {
    return await _recipeService.getRecipeDetails(id);
  }
}
