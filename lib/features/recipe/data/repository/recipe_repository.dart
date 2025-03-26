import 'package:food_recipes/core/services/api_service.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class RecipeRepository {
  final ApiService apiService;

  RecipeRepository({required this.apiService});

  Future<RecipeModel?> getRandomRecipe() async {
    final data = await apiService.getRequest("random.php");
    if (data != null && data["meals"] != null) {
      return RecipeModel.fromJson(data["meals"][0]);
    }
    return null;
  }

  Future<List<RecipeModel>> searchRecipes(String query) async {
    final data = await apiService.getRequest(
      "search.php",
      params: {"s": query},
    );
    if (data != null && data["meals"] != null) {
      return (data["meals"] as List)
          .map((meal) => RecipeModel.fromJson(meal))
          .toList();
    }
    return [];
  }

  Future<List<RecipeModel>> getRecipesByArea(String area) async {
    final data = await apiService.getRequest("filter.php", params: {"a": area});
    if (data != null && data["meals"] != null) {
      return (data["meals"] as List)
          .map(
            (meal) => RecipeModel(
              id: meal["idMeal"],
              name: meal["strMeal"],
              imageUrl: meal["strMealThumb"],
              videoUrl: meal["strYoutube"],
              category: "",
              area: area,
              instructions: "",
              ingredients: [],
              measure: [],
              tags: "",
            ),
          )
          .toList();
    }
    return [];
  }

  Future<RecipeModel?> getRecipeById(String id) async {
    final data = await apiService.getRequest("lookup.php", params: {"i": id});
    if (data != null && data["meals"] != null) {
      return RecipeModel.fromJson(data["meals"][0]);
    }
    return null;
  }
}
