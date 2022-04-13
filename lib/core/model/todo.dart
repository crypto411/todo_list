// ignore_for_file: prefer_initializing_formals

import 'dart:ui';

class Todo {
  int? id;
  late String content;
  late bool done;
  late Color color;

  Todo(this.content, this.color) {
    done = false;
  }

  Todo.fill(
      {this.id,
      required this.content,
      required this.done,
      required this.color});

  String describe() {
    return "{content: $content, done: $done}";
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'content': content,
        'done': done,
        'color': color
      };
}
