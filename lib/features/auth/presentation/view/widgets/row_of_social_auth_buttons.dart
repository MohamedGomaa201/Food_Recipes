import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/features/auth/presentation/view/helpers/show_snack_bar.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/social_media_button.dart';
import 'package:food_recipes/features/home/presentation/view/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RowOfSocialAuthButtons extends StatelessWidget {
  const RowOfSocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(
          icon: AppImages.googleIcon,
          onTap: () async {
            try {
              final googleUser = await GoogleSignIn().signIn();
              final googleAuth = await googleUser?.authentication;

              final credential = GoogleAuthProvider.credential(
                accessToken: googleAuth?.accessToken,
                idToken: googleAuth?.idToken,
              );

              final userCredential = await FirebaseAuth.instance
                  .signInWithCredential(credential);

              if (userCredential.user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => HomeView(user: userCredential.user!),
                  ),
                );
              }
            } on Exception catch (e) {
              log('Google Sign-In Exception -> $e');
              showSnackBar(context, "Failed to sign in with Google");
            }
          },
        ),
        SizedBox(width: 25.w),
        SocialMediaButton(icon: AppImages.facebookIcon, onTap: () {}),
      ],
    );
  }
}
