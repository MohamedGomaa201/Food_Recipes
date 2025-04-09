import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/custom_text_form_field.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Name"),
        SizedBox(height: 5.h),
        customTextForm(
          type: TextInputType.name,
          controller: nameController,
          hint: "Enter Name",
          validate: (value) {
            if (value.isEmpty) {
              return "Name can't be empty";
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
