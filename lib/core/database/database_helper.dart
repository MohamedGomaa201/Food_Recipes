import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:food_recipes/features/recipe/data/models/recipe_model.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'food_recipes.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE favorites(
            id TEXT PRIMARY KEY,
            recipeJson TEXT NOT NULL
          )
        ''');
      },
    );
    return _db!;
  }

  Future<void> addFavorite(RecipeModel recipe) async {
    final database = await db;
    await database.insert('favorites', {
      'id': recipe.id,
      'recipeJson': jsonEncode(recipe.toJson()),
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(String id) async {
    final database = await db;
    await database.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> isFavorite(String id) async {
    final database = await db;
    final rows = await database.query(
      'favorites',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [id],
    );
    return rows.isNotEmpty;
  }

  Future<List<RecipeModel>> getAllFavorites() async {
    final database = await db;
    final rows = await database.query('favorites', orderBy: 'rowid DESC');
    return rows.map((row) {
      final json =
          jsonDecode(row['recipeJson'] as String) as Map<String, dynamic>;
      return RecipeModel.fromJson(json);
    }).toList();
  }
}
