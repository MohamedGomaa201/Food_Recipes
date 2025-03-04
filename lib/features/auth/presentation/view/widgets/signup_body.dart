import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/custom_app_button.dart';
import 'package:food_recipes/features/auth/presentation/view/signin_view.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/non_clickable_with_clickable_text.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/row_of_social_auth_buttons.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/terms_and_condition_checkbox.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/text_inside_divider.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: ListView(
          children: [
            Text(
              "Create an account",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text("Let's help you set up your account,\nit won't take long."),
            SizedBox(height: 20.h),
            CustomTextField(aboveHint: "Name", hintText: "Enter Name"),
            SizedBox(height: 20.h),
            CustomTextField(aboveHint: "Email", hintText: "Enter Email"),
            SizedBox(height: 20.h),
            CustomTextField(aboveHint: "Password", hintText: "Enter Password"),
            SizedBox(height: 20.h),
            CustomTextField(
              aboveHint: "Confirm Password",
              hintText: "Retype Password",
            ),
            SizedBox(height: 5.h),
            TermsAndConditionCheckbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            SizedBox(height: 10.h),
            CustomAppButton(text: "Sign Up", onPressed: () {}, height: 60),
            SizedBox(height: 14.h),
            TextInsideDivider(text: "Or Sign Up With"),
            SizedBox(height: 20.h),
            RowOfSocialAuthButtons(),
            SizedBox(height: 20.h),
            NonClickableWithClickableText(
              nonClickable: "Already a member?",
              clickable: "Sign In",
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
