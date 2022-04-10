import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class TodoLocalSource{
  static String get DATABASE_NAME => "todos";
  static Future<Database> get database async => getDatabasesPath().then((String path) =>
    openDatabase(
        join(path, "todo.db"),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, content TEXT, done INTEGER, color INTEGER)',
          );
        }
    )
  );
}