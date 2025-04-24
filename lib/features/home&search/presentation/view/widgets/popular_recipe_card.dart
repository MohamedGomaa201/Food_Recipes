import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/api_service.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/data/repository/recipe_repository.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class PopularRecipeCard extends StatelessWidget {
  const PopularRecipeCard({super.key, required this.recipe});
  final RecipeModel recipe;

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
        padding: EdgeInsets.only(top: 40.h, bottom: 25.h),
        child: SizedBox(
          height: 95.h,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            clipBehavior: Clip.none,
            children: [
              Card(
                elevation: 1,
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  height: 95.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 105.w),
                        Expanded(
                          child: Text(
                            recipe.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_right_rounded),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 25.h,
                left: 10.w,
                child: CircleAvatar(
                  radius: 53.r,
                  backgroundImage: NetworkImage("${recipe.imageUrl}/small"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
