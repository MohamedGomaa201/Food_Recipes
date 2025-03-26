import 'package:flutter/material.dart';
import 'package:food_recipes/core/constants/app_images.dart';

BottomNavigationBar buildBottomNavigationBar() {
  return BottomNavigationBar(
    backgroundColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    items: [
      BottomNavigationBarItem(
        icon: Image.asset(AppImages.navInActHome),
        label: "Home",
        activeIcon: Image.asset(AppImages.navActHome),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AppImages.navInActBookmark),
        label: "Saved",
        activeIcon: Image.asset(AppImages.navActBookmark),
      ),
      BottomNavigationBarItem(
        icon: Image.asset(AppImages.navInActProfile),
        label: "Profile",
        activeIcon: Image.asset(AppImages.navActProfile),
      ),
    ],
  );
}
