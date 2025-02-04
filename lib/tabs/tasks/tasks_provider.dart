import 'package:flutter/widgets.dart';

import '../../firebase_functions.dart';
import '../../models/task_model.dart';

class TasksProvider with ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getTasks() async {
    List<TaskModel> allTasks = await FirebaseFunctions.getTaskFromFirestore();
    tasks = allTasks
        .where((task) =>
            (task.date.day == selectedDate.day &&
            task.date.month == selectedDate.month &&
            task.date.year == selectedDate.year))
        .toList();
    notifyListeners();
  }

  void getTasksByDate(DateTime changedDate) {
    selectedDate = changedDate;
    getTasks();
  }

}
