import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/custom_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.isVisible,
    required this.toggleVisibility,
    this.validator,
  });

  final TextEditingController passwordController;
  final bool isVisible;
  final VoidCallback toggleVisibility;
  final FormFieldValidator<dynamic>? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Password"),
        SizedBox(height: 5.h),
        customTextForm(
          validate:
              validator ??
              (value) {
                if (value.isEmpty) {
                  return "Please enter the password";
                } else if (value.toString().length < 8) {
                  return "Password should be more than 8 character";
                } else {
                  return null;
                }
              },
          type: TextInputType.visiblePassword,
          controller: passwordController,
          hint: "Enter Password",
          isObscure: !isVisible,
          suffix:
              isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
          suffixIconPressed: toggleVisibility,
        ),
      ],
    );
  }
}
