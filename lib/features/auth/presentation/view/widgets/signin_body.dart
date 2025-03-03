import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/constants/app_images.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/non_clickable_with_clickable_text.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/social_media_button.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/text_inside_divider.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 65.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello,",
            style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
          ),
          Text("Welcome Back!", style: TextStyle(fontSize: 20.sp)),
          SizedBox(height: 65.h),
          CustomTextField(aboveHint: "Email", hintText: "Enter Email"),
          SizedBox(height: 25.h),
          CustomTextField(aboveHint: "Password", hintText: "Enter Password"),
          SizedBox(height: 20.h),
          InkWell(
            onTap: () {},
            child: Text("Forget Password?", style: Styles.textStyleSecColor13),
          ),
          SizedBox(height: 30.h),
          CustomAppButton(text: "Sign In", onPressed: () {}, height: 65,),
          SizedBox(height: 20.h),
          TextInsideDivider(text: "Or Sign in With"),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialMediaButton(icon: AppImages.googleIcon, onTap: () {}),
              SizedBox(width: 25.w),
              SocialMediaButton(icon: AppImages.facebookIcon, onTap: () {}),
            ],
          ),
          SizedBox(height: 55.h),
          NonClickableWithClickableText(
            nonClickable: "Don't have an account?",
            clickable: "Sign up",
          ),
        ],
      ),
    );
  }
}


