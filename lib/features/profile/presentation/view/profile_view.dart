import 'package:flutter/material.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/profile_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ProfileBody(user: null,));
  }
}
