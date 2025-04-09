import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

Widget customTextForm({
  TextEditingController? controller,
  required TextInputType type,
  Function(String)? onChang,
  FormFieldValidator? validate,
  String? initialValue,
  String? hint,
  IconData? suffix,
  bool isObscure = false,
  Function()? suffixIconPressed,
  Function()? tap,
  bool? enable,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  onChanged: onChang,
  validator: validate,
  onTap: tap,
  enabled: enable,
  obscureText: isObscure,
  initialValue: initialValue,
  decoration: InputDecoration(
    hintText: hint,
    hintStyle: Styles.textStyleGrey11,
    suffixIcon:
        suffix != null
            ? IconButton(
              onPressed: suffixIconPressed,
              icon: Icon(suffix, color: AppColors.mainColor),
            )
            : null,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey4),
      borderRadius: BorderRadius.circular(10.sp),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide(color: AppColors.grey4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.sp),
      borderSide: BorderSide(color: AppColors.mainColor),
    ),
  ),
  style: TextStyle(fontSize: 14.sp),
);
