import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    String databasePath = await getDatabasesPath();
    // MAKE SURE THIS DATABASE NAME IS SAME AS FLOOR DB IF USING WITH FLOOR
    String path = p.join(databasePath, 'app_database.db');
    return await openDatabase(path);
  }


  // RUNS THE PROVIDED QUERY, RETURNS NOTHING
  Future<void> executeQuery(String query) async {
    Database db = await database;
    await db.rawQuery(query);
  }

  // RETURNS SINGLE VALUE
  Future<dynamic> executeQueryWithResult(String query) async {
    Database db = await database;
    var result = await db.rawQuery(query);
    return result.first.values.first;
  }

  // RETURNS SINGLE MODEL
  // Future<dynamic> executeQueryWithModelResult(String query) async {
  //   Database db = await database;
  //   var result = await db.rawQuery(query);
  //   return result.first;
  // }

  // RETURNS A LIST
  Future<List<Map<String, dynamic>>> loadDataList(String query) async {
    Database db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(query);
    return result;
  }






}
