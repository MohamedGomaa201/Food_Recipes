import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 75.h),
            Text(
              "Hello,",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
            ),
            Text("Welcome Back!", style: TextStyle(fontSize: 20.sp)),
            SizedBox(height: 25.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email"),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    hintText: "Enter Email",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
