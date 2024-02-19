// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController titleTextController;
  final VoidCallback onAddPressed;
  const DialogBox(
      {super.key,
      required this.titleTextController,
      required this.onAddPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add a new todo'),
      content: Container(
        height: 150,
        width: 300,
        child: Column(
          children: [
            TextField(
              controller: titleTextController,
              decoration: const InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: onAddPressed,
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
