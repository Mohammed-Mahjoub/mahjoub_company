import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class DbController {
  DbController._();

  late Database _database;
  static DbController? _instance;

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'productId INTEGER,'
            'nameEn TEXT NOT NULL,'
            'nameAr TEXT NOT NULL,'
            'infoEn TEXT NOT NULL,'
            'infoAr TEXT NOT NULL,'
            'price REAL NOT NULL,'
            'quantity INTEGER NOT NULL,'
            'overalRate TEXT,'
            'subCategoryId TEXT NOT NULL,'
            'productRate TEXT,'
            'offerPrice TEXT,'
            'favorite TEXT,'
            'imageUrl TEXT,'
            'user_id INTEGER'
            ')');
      },
      onUpgrade: (Database database, int oldVersion, int newVersion) {},
      onDowngrade: (Database database, int oldVersion, int newVersion) {},
    );
  }
}
