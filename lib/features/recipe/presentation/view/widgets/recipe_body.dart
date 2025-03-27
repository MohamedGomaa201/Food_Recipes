import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/themes/app_colors.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/attributes_row.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/ingredients.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/instructions.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_image_or_video.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_name.dart';
import 'package:food_recipes/features/recipe/presentation/view/widgets/recipe_tab_bar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RecipeBody extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeBody({super.key, required this.recipe});
  @override
  State<RecipeBody> createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedIndex = 0;
  late YoutubePlayer youtubePlayer;
  late YoutubePlayerController youtubePlayerController;
  late String videoId;
  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();

    videoId = YoutubePlayer.convertUrlToId(widget.recipe.videoUrl) ?? "";

    if (videoId.isNotEmpty) {
      youtubePlayerController = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          controlsVisibleAtStart: false,
          disableDragSeek: true,
          hideThumbnail: true,
          enableCaption: false,
          showLiveFullscreenButton: false,
        ),
      );
      youtubePlayer = YoutubePlayer(
        controller: youtubePlayerController,
        bottomActions: [
          CurrentPosition(),
          SizedBox(width: 8.w),
          ProgressBar(
            isExpanded: true,
            colors: ProgressBarColors(
              bufferedColor: Colors.white,
              handleColor: AppColors.mainColor,
              playedColor: AppColors.mainColor,
            ),
          ),
          SizedBox(width: 8.w),
          RemainingDuration(),
        ],
      );
    }

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    if (videoId.isNotEmpty) {
      youtubePlayerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
      child: Column(
        children: [
          RecipeImageOrVideo(
            isVideoPlaying: isVideoPlaying,
            onToggleVideo: () {
              setState(() {
                isVideoPlaying = !isVideoPlaying;
              });
            },
            imageUrl: widget.recipe.imageUrl,
            videoId: videoId.isNotEmpty ? videoId : null,
            youtubePlayer: videoId.isNotEmpty ? youtubePlayer : null,
          ),
          SizedBox(height: 7.h),
          RecipeName(name: widget.recipe.name),
          SizedBox(height: 7.h),
          AttributesRow(
            category: widget.recipe.category,
            area: widget.recipe.area,
            tags: widget.recipe.tags,
          ),
          RecipeTabBar(
            tabController: tabController,
            selectedIndex: selectedIndex,
          ),
          selectedIndex == 0
              ? Ingredients(
                ingredients: widget.recipe.ingredients,
                measures: widget.recipe.measure,
              )
              : Instructions(instructions: widget.recipe.instructions),
        ],
      ),
    );
  }
}
