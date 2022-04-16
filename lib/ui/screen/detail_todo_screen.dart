import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo.dart';
import 'package:todo_list/ui/viewmodel/todo_view_model.dart';

class DetailTodoScreen extends StatelessWidget {
  DetailTodoScreen({Key? key, required this.todo}) : super(key: key);

  Todo todo;

  @override
  Widget build(BuildContext context) {
    const TextStyle confirmationTextStyle = TextStyle(color: Colors.black);
    return Scaffold(
        appBar: AppBar(
          title: const Text(DETAIL_TO_DO_ITEM),
        ),
        body: SafeArea(
          child: Container(
            height: 8000,
            color: todo.color,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(todo.content),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.delete),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext dialogContext) => AlertDialog(
                title: const Text(CONFIRMATION),
                content: const Text(YOU_SURE_WANT_TO_REMOVE_THIS_ITEM),
                backgroundColor: todo.color,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    child: const Text(CANCEL, style: confirmationTextStyle),
                  ),
                  TextButton(
                    onPressed: () => {
                      Provider.of<TodoViewModel>(context, listen: false)
                          .removeTodo(todo),
                      Navigator.pop(dialogContext),
                      Navigator.pop(dialogContext),
                    },
                    child: const Text(OK, style: confirmationTextStyle),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
