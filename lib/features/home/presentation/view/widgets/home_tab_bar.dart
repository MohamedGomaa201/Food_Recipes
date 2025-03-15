import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/top_navigation_bar_tab.dart';

class HomeTabBar extends StatefulWidget {
  const HomeTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<HomeTabBar> createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {
        selectedIndex = widget.tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      dividerHeight: 0,
      overlayColor: WidgetStateColor.transparent,
      controller: widget.tabController,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      tabAlignment: TabAlignment.start,
      onTap: (value) {},
      tabs: [
        TopNavigationBarTap(selectedIndex: selectedIndex, cIndex: 0, name: "All"),
        TopNavigationBarTap(selectedIndex: selectedIndex, cIndex: 1, name: "Egyptian"),
        TopNavigationBarTap(selectedIndex: selectedIndex, cIndex: 2, name: "American"),
        TopNavigationBarTap(selectedIndex: selectedIndex, cIndex: 3, name: "Italian"),
        TopNavigationBarTap(selectedIndex: selectedIndex, cIndex: 4, name: "Turkish"),
      ],
    );
  }
}
