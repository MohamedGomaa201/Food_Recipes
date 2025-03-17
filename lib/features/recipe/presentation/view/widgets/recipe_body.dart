import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/ingredient_row.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_tab_bar.dart';

class RecipeBody extends StatefulWidget {
  const RecipeBody({super.key});

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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
                image: AssetImage("assets/images/food2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: 200.h,
          ),
          SizedBox(height: 10.h),
          Text(
            "Spicy chicken burger with French fires",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey4,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(8),
                child: Image.asset(
                  AppImages.italyFlag,
                  width: 25.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey4,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(8),
                child: Text("Vegetarian"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.grey4,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                padding: EdgeInsets.all(8),
                child: Text("Meat,Casserole"),
              ),
            ],
          ),
          RecipeTabBar(
            tabController: tabController,
            selectedIndex: selectedIndex,
          ),
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: ListView(
              children: [
                IngredientRow(ingredient: "Tomatoes", quantity: "500g"),
                IngredientRow(ingredient: "Cabbage", quantity: "300g"),
                IngredientRow(ingredient: "Taco", quantity: "300g"),
                IngredientRow(ingredient: "Slice Bread", quantity: "300g"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
