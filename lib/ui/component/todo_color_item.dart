import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/model/todo_color.dart';

class TodoColorItem extends StatefulWidget {
  late TodoColor todoColor;
  late TodoColorItemCallback todoColorItemCallback;

  TodoColorItem(
      {Key? key, required this.todoColor, required this.todoColorItemCallback})
      : super(key: key);

  @override
  State<TodoColorItem> createState() => _TodoColorItemState();

  static const ICON_SELECTED = Icons.circle;
  static const ICON_DEFAULT = Icons.circle_outlined;
}

class _TodoColorItemState extends State<TodoColorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      onPressed: () => setState(() => widget.todoColorItemCallback
          .onTodoColorItemClicked(widget.todoColor)),
      icon: Icon(
          widget.todoColor.selected
              ? TodoColorItem.ICON_DEFAULT
              : TodoColorItem.ICON_SELECTED,
          color:
              widget.todoColor.selected ? Colors.grey : widget.todoColor.color),
      iconSize: 64.0,
      padding: EdgeInsets.all(1.0),
      splashColor: widget.todoColor.color,
      splashRadius: 1.0,
    ));
  }
}

abstract class TodoColorItemCallback {
  void onTodoColorItemClicked(TodoColor todoColor);
}
