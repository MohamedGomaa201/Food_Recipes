import 'package:flutter/material.dart';
import 'package:food_recipes/core/constants/app_images.dart';

class AddToFavoriteButton extends StatelessWidget {
  const AddToFavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        padding: EdgeInsets.all(8),
        child: Image.asset(AppImages.addToFavorite, scale: 1.3),
      ),
    );
  }
}
