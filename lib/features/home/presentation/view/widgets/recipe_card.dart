import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/add_to_favorite_button.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeView(recipe: recipe)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SizedBox(
          width: 150.w,
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 176.h,
                decoration: BoxDecoration(
                  color: AppColors.grey4,
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                    image: NetworkImage(recipe.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    SizedBox(height: 131.h),
                    Center(
                      child: Text(
                        recipe.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AddToFavoriteButton(),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          color: AppColors.grey3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
