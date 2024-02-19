// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoCard extends StatelessWidget {
  final bool value;
  final String todoTitle;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onDeletePressed;
  const TodoCard(
      {super.key,
      required this.value,
      required this.todoTitle,
      required this.onChanged,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.23,
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeletePressed,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 10)],
          ),
          child: Row(children: [
            Checkbox(
              onChanged: onChanged,
              value: value,
            ),
            Text(
              todoTitle,
              style: TextStyle(
                  fontSize: 20,
                  decoration: value ? TextDecoration.lineThrough : null),
            ),
          ]),
        ),
      ),
    );
  }
}
