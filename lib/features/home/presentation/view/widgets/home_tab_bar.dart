import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/top_navigation_bar_tab.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
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
        TopNavigationBarTap(selectedIndex: 1, cIndex: 3, name: "Italian"),
        TopNavigationBarTap(selectedIndex: 1, cIndex: 4, name: "Turkish"),
      ],
    );
  }
}
