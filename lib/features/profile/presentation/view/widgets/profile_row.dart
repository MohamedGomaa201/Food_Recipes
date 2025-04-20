import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20.sp),
          SizedBox(width: 15.w),
          Text(title, style: TextStyle(fontSize: 16.sp)),
          Spacer(),
          Icon(Icons.arrow_forward_ios_outlined, size: 20.sp),
        ],
      ),
    );
  }
}
