import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/head_text.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy Policy",
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
              HeadText(title: "Privacy Policy for Recipey"),
              SizedBox(height: 5.h),
              Text(
                "Your privacy matters to us. This policy explains how Recipey collects, uses, and protects your information. By using our app, you agree to these practices.",
                style: TextStyle(fontSize: 14.sp),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 10.h),
              HeadText(title: "1. Information We Collect:"),
              SizedBox(height: 5.h),
              Text(
                "● Account Data: Name, email, and profile details\n"
                "● Usage Data: Recipes viewed, saved, or shared\n"
                "● Device Info: OS version, device model, IP address\n"
                "● User Content: Recipes, comments, or photos you post",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "2. How We Use Your Data:"),
              SizedBox(height: 5.h),
              Text(
                "● Personalize your app experience\n"
                "● Improve recipe recommendations\n"
                "● Respond to your queries or feedback\n"
                "● Send updates (opt-out anytime)\n"
                "● Analyze app performance",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "3. Data Sharing:"),
              SizedBox(height: 5.h),
              Text(
                "● Never sell your data to third parties\n"
                "● Share with trusted service providers (e.g., cloud storage)\n"
                "● Disclose if required by law or to protect rights",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "4. Your Rights:"),
              SizedBox(height: 5.h),
              Text(
                "● Access or delete your account data\n"
                "● Update/correct profile information\n"
                "● Opt out of marketing emails\n"
                "● Request data portability",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "5. Security:"),
              SizedBox(height: 5.h),
              Text(
                "● Encrypt sensitive data during transmission\n"
                "● Regular security audits\n"
                "● Limited employee access to user data",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "6. Children's Privacy:"),
              SizedBox(height: 5.h),
              Text(
                "● Not intended for users under 13\n"
                "● Delete underage accounts if discovered",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "7. Policy Changes:"),
              SizedBox(height: 5.h),
              Text(
                "● Notify users about significant updates\n"
                "● Continued use = acceptance of changes",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 20.h), // Final spacing],
            ],
          ),
        ),
      ),
    );
  }
}
