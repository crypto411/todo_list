import 'package:flutter/material.dart';

import 'model/todo.dart';
import 'model/todo_color.dart';

List<Todo> getTodoList() => <Todo>[Todo("aaa", Colors.redAccent), Todo("bbbb", Colors.greenAccent), Todo("cccc", Colors.blueAccent)];

List<TodoColor> getTodoColorList() => <TodoColor>[
  TodoColor(Colors.redAccent, selected: true),
  TodoColor(Colors.blueAccent),
  TodoColor(Colors.greenAccent),
  TodoColor(Colors.yellowAccent),
  TodoColor(Colors.orangeAccent)
];