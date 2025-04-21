import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/head_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadText(title: "Delicious Recipes, Shared with Love"),
              SizedBox(height: 5.h),
              Text(
                "At Recipey, we believe cooking is more than just a chore—it’s a way to connect, create, and celebrate life’s moments. Our mission is to inspire home cooks of all skill levels to discover the joy of cooking with easy-to-follow recipes, creative ideas, and a sprinkle of culinary magic.",
                style: TextStyle(fontSize: 14.sp),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.h),
              HeadText(title: "Our Story:"),
              SizedBox(height: 5.h),
              Text(
                "Founded by a passionate team of food lovers, Recipey started as a small blog sharing family recipes and has grown into a vibrant community of food enthusiasts. We are dedicated to bringing you the best recipes, tips, and inspiration to make your cooking experience enjoyable and fulfilling.",
                style: TextStyle(fontSize: 14.sp),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.h),
              HeadText(title: "What We Offer:"),
              SizedBox(height: 5.h),
              Text(
                "● A wide variety of recipes, from quick weeknight dinners to elaborate holiday feasts\n● Step-by-step instructions and photos to guide you through each recipe\n● A supportive community to share your cooking journey with\n● Tips and tricks to enhance your cooking skills and confidence\n● Regular updates with new recipes and seasonal favorites",
                style: TextStyle(fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
