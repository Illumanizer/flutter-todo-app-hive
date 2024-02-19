// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Dialogue_Box.dart';
import 'package:flutter_application_1/components/Todo_Card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController titleTextController = TextEditingController();
  List todos = [];

  void _onCheckboxChange(int index, bool? value) {
    setState(() {
      todos[index][1] = !todos[index][1];
    });
  }

  void onAddPressed() {
    setState(() {
      todos.add([titleTextController.text, false]);
    });
    Navigator.pop(context);
  }

  void createNewTodo() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          titleTextController: titleTextController,
          onAddPressed: onAddPressed,
        );
      },
    );
  }

  void ondeletePressed(index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: todos.isEmpty
          ? Center(
              child: Text(
                "No Todo's here....",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  value: todos[index][1],
                  todoTitle: todos[index][0],
                  onChanged: (value) => _onCheckboxChange(index, value),
                  onDeletePressed: (context) => ondeletePressed(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
