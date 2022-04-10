import 'package:flutter/material.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/core/routes.dart';
import 'package:todo_list/ui/component/todo_item.dart';
import 'package:todo_list/ui/component/todo_list.dart';

class HomeScreen extends StatefulWidget {

  // TodoRepository todoRepository = TodoRepository();

  HomeScreen({Key? key}) : super(key: key);

  List<Todo> todoList = getTodoList();
  List<TodoColor> todoColorList = getTodoColorList();
  //todoRepository.getAllTodos().then((value) => <Todo>[Todo("ddd")]);
  int counter = 0;

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> implements TodoItemCallback {

  @override
  void onItemCheckChanged(Todo todo, bool value) {
    print("${todo.describe()}, $value");
  }

  @override
  void onTodoClick(Todo todo) {
    print("todo item clicked ${todo.describe()}");
  }

  @override
  void onTodoRemove(Todo todo) {
    setState(() {
      widget.todoList.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "To-do App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("dyna's To-do"),
        ),
        body: TodoList(
          todoList: widget.todoList,
          todoItemCallback: this,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // setState(() {
            //   widget.counter++;
            //   widget.todoList.add(
            //       Todo("todo ke-${widget.counter}", widget.colorList[Random().nextInt(widget.colorList.length)])
            //   );
            //   print("todo ke-${widget.counter}");
            // });
            Navigator.pushNamed(context, ADD_TODO_PATH);
          },
        ),
      ),
    );
  }
}