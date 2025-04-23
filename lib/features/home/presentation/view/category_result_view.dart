import 'package:flutter/material.dart';
import 'package:food_recipes/features/home/presentation/view/widgets/category_results_body.dart';

class CategoryResultsView extends StatelessWidget {
  final String category;
  const CategoryResultsView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category Recipes")),
      body: CategoryResultsBody(category: category),
    );
  }
}
