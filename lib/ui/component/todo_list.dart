import 'package:flutter/material.dart';
import 'package:todo_list/core/model/todo.dart';
import 'package:todo_list/ui/component/todo_item.dart';

class TodoList extends StatelessWidget {
  List<Todo> todoList;
  TodoItemCallback todoItemCallback;

  TodoList({Key? key, required this.todoList, required this.todoItemCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todoList.isNotEmpty) {
      return ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(
                todo: todoList[index], todoItemCallback: todoItemCallback);
          });
    } else {
      return const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 64.0),
          title: Text("List empty"));
    }
  }
}
