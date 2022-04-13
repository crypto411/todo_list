import 'package:flutter/cupertino.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/ui/component/todo_color_item.dart';

class TodoColorList extends StatefulWidget {
  late List<TodoColor> todoColorList;
  late TodoColorItemCallback todoColorItemCallback;

  TodoColorList(
      {Key? key,
      required this.todoColorList,
      required this.todoColorItemCallback})
      : super(key: key);

  @override
  State<TodoColorList> createState() => _TodoColorListState();
}

class _TodoColorListState extends State<TodoColorList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(3.00),
        scrollDirection: Axis.horizontal,
        itemCount: widget.todoColorList.length,
        itemBuilder: (BuildContext, index) {
          return TodoColorItem(
            todoColor: widget.todoColorList[index],
            todoColorItemCallback: widget.todoColorItemCallback,
          );
        });
  }
}
