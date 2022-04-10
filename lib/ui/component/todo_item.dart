import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/model/todo.dart';

abstract class TodoItemCallback {
  void onTodoRemove(Todo todo);
  void onTodoClick(Todo todo);
  void onItemCheckChanged(Todo todo, bool value);
}

class TodoItem extends StatefulWidget {
  late Todo todo;
  TodoItemCallback todoItemCallback;
  TodoItem({Key? key, required this.todo, required this.todoItemCallback}) : super(key: key);

  @override
  State<TodoItem> createState() =>  TodoItemState();
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
      title: Text(widget.todo.title),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Confirmation'),
              content: const Text('You sure want to remove this item?'),
              backgroundColor: widget.todo.color,
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel', style: confirmationTextStyle),
                ),
                TextButton(
                  onPressed: () {
                    widget.todoItemCallback.onTodoRemove(widget.todo);
                    Navigator.pop(context, 'Ok');
                  },
                  child: const Text('OK', style: confirmationTextStyle),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}