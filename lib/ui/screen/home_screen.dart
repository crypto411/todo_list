import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/ui/component/todo_item.dart';
import 'package:todo_list/ui/component/todo_list.dart';
import 'package:todo_list/ui/screen/detail_todo_screen.dart';
import 'package:todo_list/ui/viewmodel/todo_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> implements TodoItemCallback {
  late List<Todo> todoList;
  List<TodoColor> todoColorList = getTodoColorList();

  @override
  void onItemCheckChanged(Todo todo, bool value) {
    print("${todo.describe()}, $value");
  }

  @override
  void onTodoClick(Todo todo) {
    setState(() {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailTodoScreen(todo: todo)))
          .whenComplete(() => refreshList());
    });
  }

  @override
  void onTodoRemove(Todo todo) {
    setState(() {
      Provider.of<TodoViewModel>(context, listen: false).removeTodo(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    refreshList();
    return MaterialApp(
      title: APP_NAME,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(APP_NAME),
        ),
        body: TodoList(
          todoList: todoList,
          todoItemCallback: this,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, ADD_TODO_PATH)
                .whenComplete(() => refreshList());
          },
        ),
      ),
    );
  }

  refreshList() {
    setState(() {
      todoList =
          Provider.of<TodoViewModel>(context, listen: false).getTodoList();
    });
  }
}
