import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/about_us.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/contact_us.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/logout_button.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/privacy_policy.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/profile_row.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/terms_and_conditions.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/user_information.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
        child: Column(
          children: [
            UserInformation(user: user!),
            SizedBox(height: 75.h),
            ProfileRow(
              icon: Icons.description_rounded,
              title: "Terms & Conditions",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsAndConditions(),
                  ),
                );
              },
            ),
            Divider(),
            SizedBox(height: 20.h),
            ProfileRow(
              icon: Icons.security_rounded,
              title: "Privacy Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrivacyPolicy(),
                  ),
                );
              },
            ),
            Divider(),
            SizedBox(height: 20.h),
            ProfileRow(
              icon: Icons.info,
              title: "About Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
            ),
            Divider(),
            SizedBox(height: 20.h),
            ProfileRow(
              icon: Icons.support,
              title: "Contact Us",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUs()),
                );
              },
            ),
            Divider(),
            SizedBox(height: 70.h),
            LogoutButton(),
            Spacer(),
            Text(
              "Version 1.0.0",
              style: TextStyle(fontSize: 16.sp, color: AppColors.grey3),
            ),
          ],
        ),
      ),
    );
  }
}
