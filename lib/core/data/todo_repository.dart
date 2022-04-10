import 'package:sqflite/sqflite.dart';
import 'package:todo_list/core/data/todo_local_source.dart';
import 'package:todo_list/core/model/todo.dart';

class TodoRepository {
  Database database = TodoLocalSource.database as Database;

  Future<void> insertTodo(Todo todo) async {
    await database.insert(
      TodoLocalSource.DATABASE_NAME,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Todo>> getAllTodos() async {
    final List<Map<String, dynamic>> maps = database.query(TodoLocalSource.DATABASE_NAME) as List<Map<String, dynamic>>;

    return List.generate(maps.length, (i) {
      return Todo.fill(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        done: maps[i]['done'],
        color: maps[i]['color'],
      );
    });
  }
}