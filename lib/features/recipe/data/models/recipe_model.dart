class RecipeModel {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> extractIngredients(Map<String, dynamic> json) {
      List<String> ingredients = [];
      for (int i = 1; i <= 20; i++) {
        String? ingredient = json['strIngredient$i'];
        if (ingredient != null && ingredient.isNotEmpty) {
          ingredients.add(ingredient);
        }
      }
      return ingredients;
    }

    return RecipeModel(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'] ?? "Unknown",
      area: json['strArea'] ?? "Unknown",
      instructions: json['strInstructions'] ?? "",
      imageUrl: json['strMealThumb'] ?? "",
      ingredients: extractIngredients(json),
    );
  }
}
