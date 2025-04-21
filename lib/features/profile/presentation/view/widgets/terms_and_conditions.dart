import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/head_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms & Conditions",
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
          child: ListView(
            children: [
              HeadText(title: "Terms & Conditions for Recipey"),
              SizedBox(height: 5.h),
              Text(
                "Welcome to Recipey! By accessing or using our app, you agree to comply with and be bound by these Terms & Conditions. If you disagree with any part, please refrain from using the app.",
                style: TextStyle(fontSize: 14.sp),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.h),
              HeadText(title: "1. Acceptance of Terms:"),
              SizedBox(height: 5.h),
              Text(
                "● By using Recipey, you confirm you are at least 13 years old (or the legal age in your jurisdiction).\n"
                "● We reserve the right to modify these terms at any time. Continued use after changes constitutes acceptance.",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "2. User Responsibilities:"),
              SizedBox(height: 5.h),
              Text(
                "● Maintain the confidentiality of your account credentials\n"
                "● Do not post harmful, offensive, or illegal content\n"
                "● Avoid reverse-engineering or exploiting app vulnerabilities\n"
                "● Respect copyright laws for shared recipes",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "3. Intellectual Property:"),
              SizedBox(height: 5.h),
              Text(
                "● All app content (except user submissions) is owned by Recipey\n"
                "● By posting recipes, you grant us a non-exclusive license to use your content",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "4. Disclaimers:"),
              SizedBox(height: 5.h),
              Text(
                "● Recipe results and nutritional info may vary - use at your own risk\n"
                "● We are not responsible for third-party content or links\n"
                "● App availability may be interrupted occasionally",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "5. Limitation of Liability:"),
              SizedBox(height: 5.h),
              Text(
                "● Recipey is not liable for damages from app use\n"
                "● We are not responsible for kitchen accidents or foodborne illnesses\n"
                "● No liability for lost data or business opportunities",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
