import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/social_media_button.dart';

class RowOfSocialAuthButtons extends StatelessWidget {
  const RowOfSocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButton(icon: AppImages.googleIcon, onTap: () {}),
        SizedBox(width: 25.w),
        SocialMediaButton(icon: AppImages.facebookIcon, onTap: () {}),
      ],
    );
  }
}
