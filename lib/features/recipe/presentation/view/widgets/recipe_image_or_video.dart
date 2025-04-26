import 'package:flutter/material.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/image_viewer.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeImageOrVideo extends StatelessWidget {
  final bool isVideoPlaying;
  final VoidCallback onToggleVideo;
  final String imageUrl;
  final String? videoId;
  final YoutubePlayer? youtubePlayer;
  final RecipeModel recipe;

  const RecipeImageOrVideo({
    super.key,
    required this.isVideoPlaying,
    required this.onToggleVideo,
    required this.imageUrl,
    this.youtubePlayer,
    this.videoId,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return isVideoPlaying && youtubePlayer != null
        ? VideoPlayer(youtubePlayer: youtubePlayer)
        : ImageViewer(
          imageUrl: imageUrl,
          videoId: videoId,
          onToggleVideo: onToggleVideo,
          recipe: recipe,
        );
  }
}
