import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class CategoryResultsBody extends StatefulWidget {
  final String category;
  const CategoryResultsBody({super.key, required this.category});

  @override
  CategoryResultsBodyState createState() => CategoryResultsBodyState();
}

class CategoryResultsBodyState extends State<CategoryResultsBody> {
  final RecipeService service = RecipeService();
  bool isLoading = true;
  List<RecipeModel> recipes = [];

  @override
  void initState() {
    super.initState();
    _loadCategory();
  }

  Future<void> _loadCategory() async {
    setState(() => isLoading = true);
    final list = await service.filterByCategory(widget.category);
    setState(() {
      recipes = list;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.mainColor),
      );
    }
    if (recipes.isEmpty) {
      return Center(child: Text('No recipes found in ${widget.category}'));
    }
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final brief = recipes[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              brief.imageUrl,
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            brief.name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          onTap: () async {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  ),
            );
            final full = await service.getRecipeDetails(brief.id);
            Navigator.pop(context);

            if (full != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeView(recipe: full)),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to load recipe details.'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        );
      },
    );
  }
}
