import 'package:flutter/material.dart';
import 'package:food_recipes/core/constants/app_images.dart';
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
      ),
    );
  }
}
