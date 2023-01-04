import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabitTile(
      {Key? key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Checkbox(value: habitCompleted, onChanged: onChanged),
          Text(
            habitName,
          ),
        ],
      ),
    );
  }
}
