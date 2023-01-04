import 'package:hive/hive.dart';

final _myBox = Hive.box("Habit_Database");

class HabitDataBase {
  List todaysHabitList = [];

  void createDefaultData() {}

  void loadData() {}

  void updateData() {}
}
