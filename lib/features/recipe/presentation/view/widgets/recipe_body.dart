import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/attributes_row.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/ingredients.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/instructions.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_image.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_name.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_tab_bar.dart';

class RecipeBody extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeBody({super.key, required this.recipe}); // Update constructor

  @override
  State<RecipeBody> createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      child: Column(
        children: [
          RecipeImage(imageUrl: widget.recipe.imageUrl),
          SizedBox(height: 10.h),
          RecipeName(name: widget.recipe.name),
          SizedBox(height: 10.h),
          AttributesRow(),
          RecipeTabBar(
            tabController: tabController,
            selectedIndex: selectedIndex,
          ),
          selectedIndex == 0
              ? Ingredients(
                ingredients: widget.recipe.ingredients,
              )
              : Instructions(
                instructions: widget.recipe.instructions,
              ),
        ],
      ),
    );
  }
}
