import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vs_wallpapers/src/models/single_image_model.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = 'id';
  static final columnPreviewUrl = 'previewURL';
  static final columnLargeImageURL = 'largeImageURL';
  static final columnTags = 'tags';
  static final columnPageURL = 'pageURL';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnPreviewUrl TEXT NOT NULL,
            $columnLargeImageURL TEXT NOT NULL,
            $columnTags TEXT NOT NULL,
            $columnPageURL TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<int>> getAllFavouritesIds() async {
    Database db = await instance.database;
    List<int> favouritesId = [];
    final v = await db.query(table, columns: [columnId]);
    for (var i in v) {
      favouritesId.add(i.values.toList()[0]);
    }
    print(favouritesId);
    return favouritesId;
  }

  Future<List<SingleImageModel>> queryAllRows() async {
    Database db = await instance.database;
    List<SingleImageModel> model = [];
    final map = await db.query(table);
    for (var i in map) {
      model.add(SingleImageModel.fromJson(i));
    }
    return model;
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
