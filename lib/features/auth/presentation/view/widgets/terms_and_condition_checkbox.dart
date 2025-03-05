import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';

class TermsAndConditionCheckbox extends StatelessWidget {
  const TermsAndConditionCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        "Accept terms & Condition",
        style: Styles.textStyleGrey11.copyWith(color: AppColors.secondaryColor),
      ),
      dense: true,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      side: BorderSide(color: AppColors.secondaryColor, width: 1.2.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.secondaryColor,
    );
  }
}