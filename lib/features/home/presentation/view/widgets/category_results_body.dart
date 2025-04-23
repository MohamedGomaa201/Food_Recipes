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
  final RecipeService _service = RecipeService();
  bool _isLoading = true;
  List<RecipeModel> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadCategory();
  }

  Future<void> _loadCategory() async {
    setState(() => _isLoading = true);
    final list = await _service.filterByCategory(widget.category);
    setState(() {
      _recipes = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_recipes.isEmpty) {
      return Center(child: Text('No recipes found in ${widget.category}'));
    }
    return ListView.builder(
      itemCount: _recipes.length,
      itemBuilder: (context, index) {
        final brief = _recipes[index];
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
            // fetch full details
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (_) => const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  ),
            );
            final full = await _service.getRecipeDetails(brief.id);
            Navigator.pop(context); // remove loading dialog

            if (full != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RecipeView(recipe: full)),
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
