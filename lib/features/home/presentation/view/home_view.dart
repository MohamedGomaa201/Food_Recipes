import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_bar/inactive_home.png"),
            label: "Home",
            activeIcon: Image.asset("assets/icons/nav_bar/active_home.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_bar/inactive_bookmark.png"),
            label: "Saved",
            activeIcon: Image.asset("assets/icons/nav_bar/active_bookmark.png"),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/icons/nav_bar/inactive_profile.png"),
            label: "Profile",
            activeIcon: Image.asset("assets/icons/nav_bar/active_profile.png"),
          ),
        ],
      ),
    );
  }
}
