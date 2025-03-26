class RecipeModel {
  final String id;
  final String name;
  final String category;
  final String tags;
  final String area;
  final String instructions;
  final String imageUrl;
  final String videoUrl;
  final List<String> ingredients;
  final List<String> measure;

  RecipeModel({
    required this.id,
    required this.name,
    required this.category,
    required this.tags,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    required this.videoUrl,
    required this.ingredients,
    required this.measure,
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

    List<String> extractMeasures(Map<String, dynamic> json) {
      List<String> measures = [];
      for (int i = 1; i <= 20; i++) {
        String? measure = json['strMeasure$i'];
        if (measure != null && measure.isNotEmpty) {
          measures.add(measure);
        }
      }
      return measures;
    }

    return RecipeModel(
      id: json["idMeal"],
      name: json["strMeal"],
      category: json["strCategory"] ?? "Unknown category",
      tags: json["strTags"] ?? "Unknown tags",
      area: json["strArea"] ?? "Unknown",
      instructions: json["strInstructions"] ?? "",
      imageUrl: json["strMealThumb"] ?? "",
      videoUrl: json["strYoutube"] ?? "",
      ingredients: extractIngredients(json),
      measure: extractMeasures(json),
    );
  }
}
