import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
    this.onTap,
  });

  final TabController tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  

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
      onTap: widget.onTap,
      tabs: widget.tabs,
    );
  }
}