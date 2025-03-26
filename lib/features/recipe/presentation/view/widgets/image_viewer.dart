import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/shared%20widgets/add_to_favorite_button.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.imageUrl,
    required this.videoId,
    required this.onToggleVideo,
  });

  final String imageUrl;
  final String? videoId;
  final VoidCallback onToggleVideo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 225.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              "$imageUrl/medium",
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: LinearGradient(
              begin: FractionalOffset.center,
              end: FractionalOffset.bottomCenter,
              colors: [Colors.transparent, Colors.black87],
            ),
          ),
          width: double.infinity,
          height: 225.h,
        ),
        Positioned(bottom: 10.h, right: 7.w, child: AddToFavoriteButton()),
        Positioned(
          top: 81.5.h,
          bottom: 81.5.h,
          right: 125.w,
          left: 125.w,
          child: GestureDetector(
            onTap: () {
              if (videoId == null || videoId!.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Video has a problem while playing."),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                onToggleVideo();
              }
            },
            child: Container(
              padding: EdgeInsets.all(5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500.r),
                color: AppColors.grey4,
              ),
              child: Icon(
                Icons.play_arrow_rounded,
                color: AppColors.mainColor,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
