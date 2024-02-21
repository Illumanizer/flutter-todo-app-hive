// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/Dialogue_Box.dart';
import 'package:flutter_application_1/components/Todo_Card.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  TodoDatabase db = TodoDatabase();

  final TextEditingController titleTextController = TextEditingController();

  @override
  void initState() {
    if(_myBox.get('TODOLIST') == null){
      db.createIniitialData();
    }
    else{
      db.loadTodoList();
    }
    super.initState();
  }
  void _onCheckboxChange(int index, bool? value) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updataTodoList();
  }

  void onAddPressed() {
    setState(() {
      db.todoList.add([titleTextController.text, false]);
      titleTextController.clear();
    });
    db.updataTodoList();
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
      db.todoList.removeAt(index);
    });
    db.updataTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: db.todoList.isEmpty
          ? Center(
              child: Text(
                "No Todo's here....",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return TodoCard(
                  value: db.todoList[index][1],
                  todoTitle: db.todoList[index][0],
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
