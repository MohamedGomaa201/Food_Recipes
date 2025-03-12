import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewRecipeCard extends StatelessWidget {
  const NewRecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h, bottom: 25.h),
      child: SizedBox(
        height: 95.h,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          clipBehavior: Clip.none,
          children: [
            Card(
              elevation: 5,
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 95.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 110.w),
                      Expanded(
                        child: Text(
                          "Steak with tomato sauce and bulgur rice.",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_right_rounded),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 25.h,
              child: Image.asset(
                "assets/images/food1.png",
                width: 110.w,
                height: 110.h,
                fit: BoxFit.cover,
              ),
            ),
            // Positioned(
            //   left: 250.w,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(
            //       horizontal: 10.w,
            //       vertical: 10.h,
            //     ),
            //     child: GestureDetector(
            //       onTap: () {},
            //       child: Container(
            //         width: 30.w,
            //         height: 30.h,
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           shape: BoxShape.circle,
            //         ),
            //         child: Image.asset(
            //           "assets/icons/bookmark.png",
            //           scale: 1,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
