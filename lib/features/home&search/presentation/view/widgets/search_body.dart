import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key, required this.query});
  final String query;
  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final RecipeService _service = RecipeService();
  bool isLoading = true;
  List<RecipeModel> results = [];

  @override
  void initState() {
    super.initState();
    _search(widget.query);
  }

  Future<void> _search(String q) async {
    setState(() => isLoading = true);
    final res = await _service.searchRecipes(q);
    setState(() {
      results = res;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.mainColor),
      );
    }
    if (results.isEmpty) {
      return Center(child: Text('No recipes found for "${widget.query}"'));
    }
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: results.length,
      itemBuilder: (context, i) {
        final result = results[i];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              result.imageUrl,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(result.name),
          subtitle: Text(result.category),
          onTap: () async {
            final full = await RecipeService().getRecipeDetails(result.id);
            if (full != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeView(recipe: full)),
              );
            }
          },
        );
      },
    );
  }
}
