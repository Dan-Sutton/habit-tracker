import 'package:flutter/material.dart';

class NewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const NewHabitBox(
      {Key? key,
      required this.controller,
      required this.onCancel,
      required this.onSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: const Text("Save"),
        ),
        MaterialButton(
          onPressed: onCancel,
          child: const Text("Cancel"),
        )
      ],
    );
  }
}
