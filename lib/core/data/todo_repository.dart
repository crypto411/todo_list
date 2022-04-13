import 'package:todo_list/core/model/todo.dart';

class TodoRepository {
  List<Todo> _todoList = [];

  void addTodo(Todo todo) {
    _todoList.add(todo);
  }

  void removeTodo(Todo todo) {
    _todoList.remove(todo);
  }

  List<Todo> getTodoList() => _todoList;

  static final TodoRepository _instance = TodoRepository._internal();

  factory TodoRepository() {
    return _instance;
  }

  TodoRepository._internal();
}
