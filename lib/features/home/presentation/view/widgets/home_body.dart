import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/core/shared%20widgets/top_navigation_bar_tab.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/core/shared%20widgets/custom_tab_bar.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/new_recipe_card_builder.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/recipe_card_builder.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/search_box.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  final RecipeService _recipeService = RecipeService();
  List<RecipeModel> _recipes = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final recipes = await _recipeService.filterByArea(
        "Egyptian",
      ); // Example category
      setState(() {
        _recipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching recipes: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
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
          CustomTabBar(
            tabController: tabController,
            tabs: [
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 0,
                name: "All",
              ),
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 1,
                name: "Egyptian",
              ),
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 2,
                name: "American",
              ),
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 3,
                name: "Italian",
              ),
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 4,
                name: "Turkish",
              ),
            ],
          ),
          _isLoading
              ? CircularProgressIndicator()
              : RecipeCardBuilder(recipes: _recipes),
          SizedBox(height: 20.h),
          Text(
            "New Recipes",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          NewRecipeCardBuilder(recipes: _recipes),
        ],
      ),
    );
  }
}
