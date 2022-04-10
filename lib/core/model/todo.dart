import 'dart:ui';

class Todo {
  int? id;
  late String title;
  late String content;
  late bool done;
  late Color color;

  Todo(this.content, this.color) {
    if(content.length >= 24) {
      title = content.substring(0, 24);
    } else {
      title = content;
    }
    done = false;
  }
  Todo.fill({this.id, required this.title, required this.content, required this.done, required this.color});

  String describe() {
    return "{title: $title, content: $content, done: $done}";
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'content': content,
    'done': done,
    'color': color
  };
}