import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habit_tracker/components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool habitCompleted = false;

  void checkBoxTapped(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: ListView(
        children: [
          // Habit Tiles
          HabitTile(
            habitCompleted: habitCompleted,
            habitName: 'Morning Jog',
            onChanged: (value) => checkBoxTapped(value),
          )
        ],
      ),
    );
  }
}
