import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/core/constants.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/ui/component/todo_color_item.dart';
import 'package:todo_list/ui/component/todo_color_list.dart';

class AddTodoScreen extends StatefulWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  List<TodoColor> todoColorList = getTodoColorList();

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen>
    implements TodoColorItemCallback {
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
          title: const Text("Add to-do item"),
        ),
        // body: Container(
        //     padding: EdgeInsets.all(5.0),
        //     color: getSelectedTodoColor(widget.todoColorList) ??
        //         widget.todoColorList[0].color,
        //     child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         children: [
        //           TodoColorList(
        //               todoColorList: widget.todoColorList,
        //               todoColorItemCallback: this),
        //           const Text("aaa")
        //         ])));
        body: SafeArea(
            child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(16.0),
                color: getSelectedTodoColor(widget.todoColorList),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: TodoColorList(
                            todoColorList: widget.todoColorList,
                            todoColorItemCallback: this)
                      ),
                      Flexible(
                          flex: 6,
                          child: TextField(decoration: InputDecoration(hintText: "dsadsa")))
                    ]))));
  }

  Color? getSelectedTodoColor(List<TodoColor> todoColorList) {
    if (todoColorList.isEmpty) return null;
    return todoColorList.singleWhere((todoColor) => todoColor.selected).color;
  }
}
