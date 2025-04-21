import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/profile/presentation/view/widgets/head_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contact Us",
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
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadText(title: "1. General Inquiries:"),
              SizedBox(height: 5.h),
              Text(
                "● Email: gomaa.mohamed1917@gmail.com\n"
                "● Phone: +20 1015043548",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "2. Technical Support:"),
              SizedBox(height: 5.h),
              Text(
                "● Email: tech@recipey.app\n"
                "● In-App: Go to Settings > Help Center",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "3. Business Partnerships:"),
              SizedBox(height: 5.h),
              Text(
                "● Email: partnerships@recipey.app\n"
                "● Phone: +1 (555) 123-4567",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "4. Social Media:"),
              SizedBox(height: 5.h),
              Text(
                "● Instagram: @RecipeyApp\n"
                "● Facebook: /RecipeyOfficial\n"
                "● Twitter: @RecipeyTweets",
                style: TextStyle(fontSize: 14.sp),
              ),
              SizedBox(height: 10.h),
              HeadText(title: "Response Time:"),
              SizedBox(height: 5.h),
              Text(
                "We aim to respond within 24-48 hours.",
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
