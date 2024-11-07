import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao.dart';
import 'test_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [TestModel])
abstract class AppDatabase extends FloorDatabase {
  DatabaseDao get dao;
}

// The singleton class for accessing the database instance,
// it will return singleton instance of floor, app wide !
class DatabaseSingleton {
  static AppDatabase? _database;

  static Future<AppDatabase> getDatabase() async {
    _database ??= await $FloorAppDatabase
        .databaseBuilder('app_database.db')
        .addMigrations([migration1to2, migration2to3])
        .build();
    return _database!;
  }
}

// MIGRATION CODE
/// ADD MIGRATION TO DATABASE BUILDER
/// CHANGE VERSION ALSO

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute("alter table Admins add column bouncedItems TEXT");
  await database.execute("alter table Admins add column bouncedQty TEXT");
});

final migration2to3 = Migration(2, 3, (database) async {
  await database.execute("alter table Admins add column scheme TEXT");
});