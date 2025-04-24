// features/home/presentation/view/category_selection_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipes/core/services/recipe_service.dart';
import 'package:food_recipes/features/home&search/presentation/view/category_result_view.dart';
import 'package:food_recipes/features/home&search/presentation/view/widgets/search_box.dart';
import 'package:food_recipes/features/home&search/presentation/view/search_view.dart';
import 'package:food_recipes/features/recipe/data/models/category_model.dart';
import 'package:food_recipes/core/themes/app_colors.dart';

class CategorySelectionView extends StatefulWidget {
  const CategorySelectionView({super.key});

  @override
  CategorySelectionViewState createState() => CategorySelectionViewState();
}

class CategorySelectionViewState extends State<CategorySelectionView> {
  final RecipeService _service = RecipeService();
  late Future<List<CategoryModel>> _futureCats;

  @override
  void initState() {
    super.initState();
    _futureCats = _service.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick a category")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: SearchBox(
              onSubmitted: (query) {
                if (query.trim().isEmpty) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchView(query: query.trim()),
                  ),
                );
              },
              // no onTap here, so it's editable
            ),
          ),
          Expanded(
            child: FutureBuilder<List<CategoryModel>>(
              future: _futureCats,
              builder: (ctx, snap) {
                if (snap.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ),
                  );
                }
                final cats = snap.data ?? [];
                return ListView.builder(
                  itemCount: cats.length,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  itemBuilder: (_, i) {
                    final cat = cats[i];
                    return ListTile(
                      leading: Image.network(
                        cat.thumb,
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                      title: Text(cat.name, style: TextStyle(fontSize: 16.sp)),
                      subtitle: Text(
                        cat.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.sp),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => CategoryResultsView(category: cat.name),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
