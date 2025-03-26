import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/core/themes/styles.dart';
import 'package:food_recipes/features/recipe/data/functions/get_flag_path.dart';
import 'package:food_recipes/features/recipe/data/functions/get_limited_tags.dart';

class AttributesRow extends StatelessWidget {
  const AttributesRow({
    super.key,
    required this.category,
    required this.area,
    required this.tags,
  });
  final String category;
  final String area;
  final String tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(12.r),
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            getFlagImagePath(area),
            width: 25.w,
            height: 20.h,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey4,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(8),
            child: Text(category, style: Styles.tagAndCategoryStyle),
          ),
        ),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.grey4,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(8),
            child: Text(
              getLimitedTags(tags),
              style: Styles.tagAndCategoryStyle,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
