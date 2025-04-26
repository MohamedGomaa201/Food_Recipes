import 'dart:convert';
import 'package:food_recipes/core/database/favorites_db.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class FavoritesRepository {
  final _dbHelper = FavoritesDb.instance;
  final String userId;

  FavoritesRepository({required this.userId});

  Future<void> toggleFavorite(RecipeModel r) async {
    final db = await _dbHelper.db;
    final rows = await db.query(
      'favorites',
      where: 'idMeal = ? AND userId = ?',
      whereArgs: [r.id, userId],
    );

    if (rows.isEmpty) {
      await db.insert('favorites', {
        'idMeal': r.id,
        'userId': userId,
        'data': jsonEncode(r.toJson()),
        'addedAt': DateTime.now().millisecondsSinceEpoch,
      });
    } else {
      await db.delete(
        'favorites',
        where: 'idMeal = ? AND userId = ?',
        whereArgs: [r.id, userId],
      );
    }
  }

  Future<bool> isFavorite(String id) async {
    final db = await _dbHelper.db;
    final rows = await db.query(
      'favorites',
      columns: ['idMeal'],
      where: 'idMeal = ? AND userId = ?',
      whereArgs: [id, userId],
    );
    return rows.isNotEmpty;
  }

  Future<List<RecipeModel>> getFavorites() async {
    final db = await _dbHelper.db;
    final rows = await db.query(
      'favorites',
      where: 'userId = ?',
      whereArgs: [userId],
      orderBy: 'addedAt DESC',
    );

    return rows.map((r) {
      final jsonStr = r['data'] as String;
      final jsonMap = jsonDecode(jsonStr) as Map<String, dynamic>;
      return RecipeModel.fromJson(jsonMap);
    }).toList();
  }
}
