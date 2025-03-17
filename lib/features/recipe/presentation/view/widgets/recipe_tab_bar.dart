import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/custom_tab_bar.dart';
import 'package:food_recipes/core/shared%20widgets/top_navigation_bar_tab.dart';

class RecipeTabBar extends StatelessWidget {
  const RecipeTabBar({
    super.key,
    required this.tabController,
    required this.selectedIndex,
  });

  final TabController tabController;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.h),
      child: CustomTabBar(
        tabController: tabController,
        tabs: [
          TopNavigationBarTap(
            selectedIndex: selectedIndex,
            cIndex: 0,
            name: "Ingredient",
          ),
          TopNavigationBarTap(
            selectedIndex: selectedIndex,
            cIndex: 1,
            name: "Instructions",
          ),
        ],
      ),
    );
  }
}
