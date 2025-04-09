import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Email"),
        SizedBox(height: 5.h),
        customTextForm(
          type: TextInputType.emailAddress,
          controller: emailController,
          hint: "Enter Email",
          validate: (value) {
            if (value.isEmpty) {
              return "Email can't be empty";
            } else if (!value.contains("@")) {
              return "Email isn't valid";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
