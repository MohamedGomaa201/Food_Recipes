import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/search_box.dart';
import 'package:food_recipes/features/splash/presentation/view/splash_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello Mohamed",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            IconButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SplashView()),
                );
              },
              icon: const Icon(Icons.logout_outlined),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          "What are you cooking today?",
          style: Styles.textStyleGrey11.copyWith(color: AppColors.grey3),
        ),
        SizedBox(height: 30.h),
        const SearchBox(),
        SizedBox(height: 15.h),
      ],
    );
  }
}
