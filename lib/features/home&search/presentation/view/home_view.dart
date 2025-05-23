import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/features/home&search/presentation/view/widgets/home_body.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/profile_body.dart';
import 'package:food_recipes/features/saved/presentation/view/widgets/saved_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.user});
  final User user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeBody(user: widget.user),
      SavedBody(),
      ProfileBody(user: widget.user),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i) => setState(() => currentIndex = i),
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
