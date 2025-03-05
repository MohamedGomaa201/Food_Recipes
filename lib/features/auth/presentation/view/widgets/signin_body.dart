import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/features/auth/presentation/view/signup_view.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/non_clickable_with_clickable_text.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/row_of_social_auth_buttons.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/text_inside_divider.dart';
import 'package:food_recipes/features/home/presentation/view/home_view.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 65.h),
      child: ListView(
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
          CustomAppButton(
            text: "Sign In",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            },
            height: 65,
          ),
          SizedBox(height: 20.h),
          TextInsideDivider(text: "Or Sign in With"),
          SizedBox(height: 20.h),
          RowOfSocialAuthButtons(),
          SizedBox(height: 55.h),
          NonClickableWithClickableText(
            nonClickable: "Don't have an account?",
            clickable: "Sign up",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignupView()),
              );
            },
          ),
        ],
      ),
    );
  }
}
