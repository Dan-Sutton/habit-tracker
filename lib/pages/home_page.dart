import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habit_tracker/components/habit_tile.dart';
import 'package:habit_tracker/components/my_fab.dart';
import 'package:habit_tracker/components/new_habit_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todaysHabitList = [
    ["Morning Run", false],
    ["Reading Book", false]
  ];

  bool habitCompleted = false;

  void checkBoxTapped(bool? value, int index) {
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return NewHabitBox();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFab(
        onPressed: createNewHabit,
      ),
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: HabitTile(
                habitName: todaysHabitList[index][0],
                habitCompleted: todaysHabitList[index][1],
                onChanged: (value) => checkBoxTapped(value, index)),
          );
        }),
      ),
    );
  }
}
