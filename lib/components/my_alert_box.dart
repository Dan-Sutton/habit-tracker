import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final String hint;

  const MyAlertBox(
      {Key? key,
      required this.controller,
      required this.onCancel,
      required this.onSave,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hint),
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
