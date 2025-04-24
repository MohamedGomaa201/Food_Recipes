import 'package:flutter/material.dart';
import 'package:food_recipes/features/home&search/presentation/view/widgets/search_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: SearchBody(query: query),
    );
  }
}