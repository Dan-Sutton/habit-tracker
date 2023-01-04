import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? settingsTapped;
  final Function(BuildContext)? deleteTapped;

  const HabitTile(
      {Key? key,
      required this.habitName,
      required this.habitCompleted,
      required this.onChanged,
      required this.settingsTapped,
      required this.deleteTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: settingsTapped,
          backgroundColor: Colors.grey,
          borderRadius: BorderRadius.circular(12),
          icon: Icons.settings,
        ),
        SlidableAction(
          onPressed: deleteTapped,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(12),
          icon: Icons.delete,
        )
      ]),
      child: Container(
        padding: const EdgeInsets.all(24),
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
      ),
    );
  }
}
