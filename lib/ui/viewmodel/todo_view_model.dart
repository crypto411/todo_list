import 'package:flutter/cupertino.dart';
import 'package:todo_list/core/data/todo_repository.dart';
import 'package:todo_list/core/model/todo.dart';

class TodoViewModel with ChangeNotifier {
  List<Todo> getTodoList() => TodoRepository().getTodoList();

  void removeTodo(Todo todo) => TodoRepository().removeTodo(todo);

  void addTodo(Todo todo) => TodoRepository().addTodo(todo);
}
