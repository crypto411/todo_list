// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/ui/screen/add_todo_screen.dart';
import 'package:todo_list/ui/screen/home_screen.dart';
import 'package:todo_list/ui/viewmodel/todo_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TodoViewModel()),
      ],
      child: MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
            appBarTheme: AppBarTheme(), primaryColor: Colors.deepOrangeAccent),
        initialRoute: "/",
        routes: {
          HOME_PATH: (context) => HomeScreen(),
          ADD_TODO_PATH: (context) => AddTodoScreen()
        },
      ),
    );
  }
}
