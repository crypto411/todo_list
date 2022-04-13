import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo.dart';

abstract class TodoItemCallback {
  void onTodoRemove(Todo todo);

  void onTodoClick(Todo todo);

  void onItemCheckChanged(Todo todo, bool value);
}

class TodoItem extends StatefulWidget {
  late Todo todo;
  TodoItemCallback todoItemCallback;

  TodoItem({Key? key, required this.todo, required this.todoItemCallback})
      : super(key: key);

  @override
  State<TodoItem> createState() => TodoItemState();
}

class TodoItemState extends State<TodoItem> {
  void onItemCheck(bool? value) {
    setState(() {
      widget.todo.done = !widget.todo.done;
      widget.todoItemCallback.onItemCheckChanged(widget.todo, widget.todo.done);
    });
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle confirmationTextStyle = TextStyle(color: Colors.black);
    return ListTile(
      onTap: () => widget.todoItemCallback.onTodoClick(widget.todo),
      tileColor: widget.todo.color,
      selectedTileColor: widget.todo.color,
      selected: widget.todo.done,
      leading: Checkbox(
        onChanged: (bool? value) {
          onItemCheck(value ?? false);
        },
        value: widget.todo.done,
      ),
      title: Text(widget.todo.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis),
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(CONFIRMATION),
                content: const Text(YOU_SURE_WANT_TO_REMOVE_THIS_ITEM),
                backgroundColor: widget.todo.color,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, CANCEL),
                    child: const Text(CANCEL, style: confirmationTextStyle),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.todoItemCallback.onTodoRemove(widget.todo);
                      Navigator.pop(context, OK);
                    },
                    child: const Text(OK, style: confirmationTextStyle),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
