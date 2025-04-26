import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDb {
  FavoritesDb._();
  static final FavoritesDb instance = FavoritesDb._();

  Database? _db;
  Future<Database> get db async {
    if (_db != null) return _db!;
    final docs = await getApplicationDocumentsDirectory();
    final path = join(docs.path, 'favorites.db');
    _db = await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    return _db!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites(
        idMeal   TEXT,
        userId   TEXT,
        data     TEXT,
        addedAt  INTEGER,
        PRIMARY KEY(idMeal, userId)
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 3) {
      await db.execute('DROP TABLE IF EXISTS favorites');
      await _onCreate(db, newVersion);
    }
  }
}
