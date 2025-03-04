import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaButton extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const SocialMediaButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.w),
        onTap: () {},
        child: Container(
          width: 44.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: Image.asset(icon),
        ),
      ),
    );
  }
}
