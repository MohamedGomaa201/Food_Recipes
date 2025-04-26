import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/api_service.dart';
import 'package:food_recipes/core/shared%20widgets/add_to_favorite_button.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/data/repository/recipe_repository.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final fullRecipe = await RecipeRepository(
          apiService: ApiService(),
        ).getRecipeById(recipe.id);

        if (fullRecipe != null) {
          Navigator.push(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => RecipeView(recipe: fullRecipe),
            ),
          );
        } else {
          CircularProgressIndicator(color: AppColors.mainColor);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          width: 150.w,
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: Image.network(
                  "${recipe.imageUrl}/small",
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 5.h),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                  child: Text(
                    recipe.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddToFavoriteButton(recipe: recipe),
                  Icon(Icons.arrow_forward_ios_sharp, color: AppColors.grey3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
