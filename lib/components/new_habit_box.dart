import 'package:flutter/material.dart';

class NewHabitBox extends StatelessWidget {
  const NewHabitBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(),
      actions: [
        MaterialButton(
          onPressed: () {},
          child: Text("Save"),
        ),
        MaterialButton(
          onPressed: () {},
          child: Text("Cancel"),
        )
      ],
    );
  }
}
