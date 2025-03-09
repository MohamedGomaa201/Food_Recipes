import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/recipe_card.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/top_navigation_bar_tab.dart';

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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            TextField(
              cursorColor: AppColors.mainColor,
              decoration: InputDecoration(
                prefixIcon: Image.asset(AppImages.searchIcon),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey4),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide(color: AppColors.grey4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                  borderSide: BorderSide(color: AppColors.mainColor),
                ),
                hintText: "Search recipe",
                hintStyle: Styles.textStyleGrey11,
              ),
            ),
            SizedBox(height: 15.h),
            TabBar(
              indicatorColor: Colors.transparent,
              dividerHeight: 0,
              overlayColor: WidgetStateColor.transparent,
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabAlignment: TabAlignment.start,
              onTap: (value) {},
              tabs: [
                TopNavigationBarTap(selectedIndex: 1, cIndex: 0, name: "All"),
                TopNavigationBarTap(
                  selectedIndex: 1,
                  cIndex: 1,
                  name: "Egyptian",
                ),
                TopNavigationBarTap(
                  selectedIndex: 1,
                  cIndex: 2,
                  name: "American",
                ),
                TopNavigationBarTap(
                  selectedIndex: 1,
                  cIndex: 3,
                  name: "Italian",
                ),
                TopNavigationBarTap(
                  selectedIndex: 1,
                  cIndex: 4,
                  name: "Turkish",
                ),
              ],
            ),
            SizedBox(
              height: 231.h,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => RecipeCard(),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "New Recipes",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            Card(
              color: Colors.white,
              child: SizedBox(
                width: 251.w,
                height: 95.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Steak with tomato sauce and bulgur rice.",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Image.asset("assets/images/food1.png"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
