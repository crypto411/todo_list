
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/ui/component/todo_item.dart';
import 'package:todo_list/core/model/todo.dart';

class TodoList extends StatefulWidget{
  List<Todo> todoList;
  TodoItemCallback todoItemCallback;
  TodoList({Key? key, required this.todoList, required this.todoItemCallback}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    if(widget.todoList.isNotEmpty) {
      return ListView.builder(
          itemCount: widget.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(todo: widget.todoList[index], todoItemCallback: widget.todoItemCallback);
          });
    }
    else {
      return const ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 64.0),
        title: Text("List empty")
      );
    }
  }
}