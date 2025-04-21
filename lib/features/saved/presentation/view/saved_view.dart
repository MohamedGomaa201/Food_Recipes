import 'package:flutter/material.dart';
import 'package:food_recipes/features/saved/presentation/view/widgets/saved_body.dart';
class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SavedBody());
  }
}
