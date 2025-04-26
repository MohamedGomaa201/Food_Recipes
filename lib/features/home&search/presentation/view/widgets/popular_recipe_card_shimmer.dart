import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class PopularRecipeCardShimmer extends StatelessWidget {
  const PopularRecipeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * .27;
    return SizedBox(
      height: height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 3,
          padding: EdgeInsets.only(top: 40.h, bottom: 25.h),
          itemBuilder:
              (_, __) => Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: SizedBox(
                  height: 95.h,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Card(
                        elevation: 1,
                        child: Container(
                          width: double.infinity,
                          height: 95.h,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        bottom: 25.h,
                        left: 10.w,
                        child: CircleAvatar(
                          radius: 53.r,
                          backgroundColor: Colors.grey[200]!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
