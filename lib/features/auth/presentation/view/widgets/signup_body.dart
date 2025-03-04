import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/custom_text_field.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20.h),
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.secondaryColor,
              overlayColor: WidgetStatePropertyAll(AppColors.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
