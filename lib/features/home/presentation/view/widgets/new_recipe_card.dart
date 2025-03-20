import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/recipe_view.dart';

class NewRecipeCard extends StatelessWidget {
  const NewRecipeCard({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecipeView(recipe: recipe,)),
        );
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
                        SizedBox(width: 95.w),
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
                bottom: 15.h,
                child: Image.network(
                  recipe.imageUrl,
                  width: 110.w,
                  height: 110.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
