// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'model/todo.dart';
import 'model/todo_color.dart';

List<TodoColor> getTodoColorList() => <TodoColor>[
      TodoColor(Colors.redAccent, selected: true),
      TodoColor(Colors.blueAccent),
      TodoColor(Colors.greenAccent),
      TodoColor(Colors.yellowAccent),
      TodoColor(Colors.orangeAccent)
    ];

// text
const String APP_NAME = "dyna's Todo";
const String INPUT_ANY_STUFF_TO_DO = "Input any stuff to do.";
const String ADD_TO_DO_ITEM = "Add to-do item";
const String DETAIL_TO_DO_ITEM = "Detail to-do item";
const String CONFIRMATION = "Confirmation";
const String YOU_SURE_WANT_TO_REMOVE_THIS_ITEM = "You sure want to remove this item?";
const String OK = "Ok";
const String CANCEL = "Cancel";
const String WARNING = "Warning";
const String TEXT_ARE_EMPTY = "Text are empty!";


// routes
const String HOME_PATH = "/";
const String ADD_TODO_PATH = "/add-todo";
const String DETAIL_TODO_PATH = "/detail-todo";
