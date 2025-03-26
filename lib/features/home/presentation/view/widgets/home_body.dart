import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/core/shared%20widgets/top_navigation_bar_tab.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/shared%20widgets/custom_tab_bar.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/home_header.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/popular_recipe_card_builder.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/recipe_card_builder.dart';
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
  final RecipeService recipeService = RecipeService();
  Map<String, List<RecipeModel>> cachedRecipes = {};
  List<RecipeModel> _recipes = [];
  List<RecipeModel> _cachedPopularRecipes = [];
  bool isLoading = true;
  bool isPopularRecipesLoaded = false;

  String getSelectedArea() {
    switch (selectedIndex) {
      case 1:
        return "Egyptian";
      case 2:
        return "American";
      case 3:
        return "Italian";
      case 4:
        return "Turkish";
      case 5:
        return "Chinese";
      default:
        return "All";
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 6, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
      fetchRecipes(getSelectedArea());
    });

    fetchRecipes(getSelectedArea());
    fetchPopularRecipes();
  }

  Future<void> fetchRecipes(String area) async {
    if (cachedRecipes.containsKey(area)) {
      setState(() {
        _recipes = cachedRecipes[area]!;
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      List<RecipeModel> mainRecipes = [];

      if (area == "All") {
        for (int i = 0; i < 5; i++) {
          final randomRecipe = await recipeService.getRandomRecipe();
          if (randomRecipe != null) {
            mainRecipes.add(randomRecipe);
          }
        }
      } else {
        mainRecipes = await recipeService.filterByArea(area);
      }

      setState(() {
        cachedRecipes[area] = mainRecipes;
        _recipes = mainRecipes;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Text("Error fetching recipes: $e");
    }
  }

  Future<void> fetchPopularRecipes() async {
    if (isPopularRecipesLoaded) return;

    Set<String> usedRecipeIds = _recipes.map((recipe) => recipe.id).toSet();
    List<RecipeModel> popularRecipes = [];

    while (popularRecipes.length < 5) {
      final randomRecipe = await recipeService.getRandomRecipe();
      if (randomRecipe != null && !usedRecipeIds.contains(randomRecipe.id)) {
        popularRecipes.add(randomRecipe);
        usedRecipeIds.add(randomRecipe.id);
      }
    }

    setState(() {
      _cachedPopularRecipes = popularRecipes;
      isPopularRecipesLoaded = true;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.h),
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeHeader(),
          CustomTabBar(
            tabController: tabController,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              fetchRecipes(getSelectedArea());
            },
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
              TopNavigationBarTap(
                selectedIndex: selectedIndex,
                cIndex: 5,
                name: "Chinese",
              ),
            ],
          ),
          isLoading
              ? Center(
                child: CircularProgressIndicator(color: AppColors.mainColor),
              )
              : RecipeCardBuilder(recipes: _recipes),
          SizedBox(height: 20.h),
          Text(
            "Popular Recipes",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
          PopularRecipeCardBuilder(recipes: _cachedPopularRecipes),
        ],
      ),
    );
  }
}
