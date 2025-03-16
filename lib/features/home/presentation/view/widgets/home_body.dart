import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/home_tab_bar.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/new_recipe_card_builder.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/recipe_card_builder.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/search_box.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text(
            "Hello Mohamed",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5.h),
          Text(
            "What are you cooking today?",
            style: Styles.textStyleGrey11.copyWith(color: AppColors.grey3),
          ),
          SizedBox(height: 30.h),
          SearchBox(),
          SizedBox(height: 15.h),
          HomeTabBar(tabController: _tabController),
          RecipeCardBuilder(),
          SizedBox(height: 20.h),
          Text(
            "New Recipes",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
          ),
          NewRecipeCardBuilder(),
        ],
      ),
    );
  }
}
