import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoritesDb {
  FavoritesDb._();
  static final FavoritesDb instance = FavoritesDb._();

  Database? myDb;
  Future<Database> get db async {
    if (myDb != null) return myDb!;
    final docs = await getApplicationDocumentsDirectory();
    final path = join(docs.path, 'favorites.db');
    myDb = await openDatabase(
      path,
      version: 3,
      onCreate: onCreate,
      onUpgrade: _onUpgrade,
    );
    return myDb!;
  }

  Future onCreate(Database db, int version) async {
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
      await onCreate(db, newVersion);
    }
  }
}
