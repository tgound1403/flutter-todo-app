import 'package:flutter/foundation.dart';
import 'task.dart';
import 'dart:collection';

class Data extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView<Task>(_tasks);
  }

  void addTask(newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void checkTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void editTask(Task task, String name) {
    task.setName(name);
    notifyListeners();
  }

  int getTaskDone(List<Task> tasks) {
    int count = 0;
    for(Task task in tasks) {
      if (task.isDone == true) {
        count++;
      }
    }
    return count;

  }

  int get tasksCount => _tasks.length;
}
