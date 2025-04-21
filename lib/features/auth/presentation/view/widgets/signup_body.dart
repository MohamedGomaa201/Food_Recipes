import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/features/auth/presentation/view/signin_view.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/email_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/name_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/non_clickable_with_clickable_text.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/password_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/row_of_social_auth_buttons.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/signup_button.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/terms_and_condition_checkbox.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/text_inside_divider.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool isChecked = false;
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassVisible = false;
  bool isConfirmPassVisible = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Let's help you set up your account,\nit won't take long.",
                ),
                SizedBox(height: 20.h),
                NameField(nameController: nameController),
                SizedBox(height: 20.h),
                EmailField(emailController: emailController),
                SizedBox(height: 20.h),
                PasswordField(
                  passwordController: passwordController,
                  isVisible: isPassVisible,
                  toggleVisibility: () {
                    setState(() {
                      isPassVisible = !isPassVisible;
                    });
                  },
                ),
                SizedBox(height: 20.h),
                PasswordField(
                  passwordController: confirmPasswordController,
                  isVisible: isConfirmPassVisible,
                  toggleVisibility: () {
                    setState(() {
                      isConfirmPassVisible = !isConfirmPassVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
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
                SignupButton(
                  emailController: emailController,
                  passwordController: passwordController,
                  formKey: formKey,
                  nameController: nameController,
                ),
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
        ),
      ),
    );
  }
}
