import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/bottom_nav_bar.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userCredential});
  final UserCredential userCredential;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
