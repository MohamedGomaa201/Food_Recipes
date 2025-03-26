import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key, required this.youtubePlayer});

  final YoutubePlayer? youtubePlayer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: youtubePlayer,
      ),
    );
  }
}
