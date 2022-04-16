import 'package:flutter/cupertino.dart';
import 'package:todo_list/core/model/todo_color.dart';
import 'package:todo_list/ui/component/todo_color_item.dart';

class TodoColorList extends StatelessWidget {
  late List<TodoColor> todoColorList;
  late TodoColorItemCallback todoColorItemCallback;

  TodoColorList(
      {Key? key,
      required this.todoColorList,
      required this.todoColorItemCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(3.00),
        scrollDirection: Axis.horizontal,
        itemCount: todoColorList.length,
        itemBuilder: (itemBuildContext, index) {
          return TodoColorItem(
            todoColor: todoColorList[index],
            todoColorItemCallback: todoColorItemCallback,
          );
        });
  }
}
