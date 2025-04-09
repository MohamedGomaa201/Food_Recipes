import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/auth/presentation/view/signup_view.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/email_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/non_clickable_with_clickable_text.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/password_field.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/row_of_social_auth_buttons.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/signin_button.dart';
import 'package:food_recipes/features/auth/presentation/view/widgets/text_inside_divider.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 65.h),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                "Hello,",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
              Text("Welcome Back!", style: TextStyle(fontSize: 20.sp)),
              SizedBox(height: 65.h),
              EmailField(emailController: emailController),
              SizedBox(height: 25.h),
              PasswordField(
                passwordController: passwordController,
                isVisible: isVisible,
                toggleVisibility: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {},
                child: Text(
                  "Forget Password?",
                  style: Styles.textStyleSecColor13,
                ),
              ),
              SizedBox(height: 30.h),
              SigninButton(
                formKey: formKey,
                emailController: emailController,
                passwordController: passwordController,
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
        ),
      ),
    );
  }
}
