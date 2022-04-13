import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/ui/component/todo_color_item.dart';
import 'package:todo_list/ui/component/todo_color_list.dart';
import 'package:todo_list/ui/viewmodel/todo_view_model.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  List<TodoColor> todoColorList = getTodoColorList();

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen>
    implements TodoColorItemCallback {
  TextEditingController contentController = TextEditingController();

  @override
  void onTodoColorItemClicked(TodoColor todoColor) {
    for (int i = 0; i < widget.todoColorList.length; i++) {
      if (widget.todoColorList[i].selected) {
        setState(() => widget.todoColorList[i].selected = false);
      }
      if (widget.todoColorList[i] == todoColor) {
        setState(() => widget.todoColorList[i].selected = true);
      }
      print(
          "it ${widget.todoColorList[i].color} ${widget.todoColorList[i].selected}");
    }
    print("todoColor ${todoColor.color} ${todoColor.selected}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(ADD_TO_DO_ITEM),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () => {
                  setState(() {
                    if (contentController.text.isEmpty) {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text(WARNING),
                                content: const Text(TEXT_ARE_EMPTY),
                                backgroundColor:
                                    getSelectedTodoColor(widget.todoColorList),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, OK),
                                    child: const Text(OK,
                                        style: TextStyle(color: Colors.black)),
                                  ),
                                ],
                              ));
                    } else {
                      Provider.of<TodoViewModel>(context, listen: false)
                          .addTodo(Todo(
                              contentController.text,
                              getSelectedTodoColor(widget.todoColorList) ??
                                  Colors.transparent));
                      Navigator.pop(context);
                    }
                  })
                }),
        body: SafeArea(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(8.0),
                color: getSelectedTodoColor(widget.todoColorList),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          flex: 2,
                          child: TodoColorList(
                              todoColorList: widget.todoColorList,
                              todoColorItemCallback: this)),
                      const Spacer(flex: 1),
                      Flexible(
                          flex: 12,
                          child: TextField(
                              autofocus: true,
                              controller: contentController,
                              maxLines: 40,
                              decoration: InputDecoration(
                                  hintStyle:
                                      TextStyle(color: Colors.deepPurple),
                                  hintText: INPUT_ANY_STUFF_TO_DO,
                                  focusColor: getSelectedTodoColor(
                                      widget.todoColorList))))
                    ]))));
  }

  Color? getSelectedTodoColor(List<TodoColor> todoColorList) {
    if (todoColorList.isEmpty) return null;
    return todoColorList.singleWhere((todoColor) => todoColor.selected).color;
  }
}
