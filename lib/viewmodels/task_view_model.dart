import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

enum TaskFilter { all, active, completed }

class TaskViewModel extends ChangeNotifier {
  static const String _tasksKey = 'tasks';
  
  List<TaskItem> _tasks = [];
  TaskFilter _currentFilter = TaskFilter.all;
  bool _isLoading = false;

  List<TaskItem> get tasks {
    switch (_currentFilter) {
      case TaskFilter.all:
        return _tasks;
      case TaskFilter.active:
        return _tasks.where((task) => !task.isTaskCompleted).toList();
      case TaskFilter.completed:
        return _tasks.where((task) => task.isTaskCompleted).toList();
    }
  }

  TaskFilter get currentFilter => _currentFilter;
  bool get isLoading => _isLoading;
  
  int get totalTasks => _tasks.length;
  int get activeTasks => _tasks.where((task) => !task.isTaskCompleted).length;
  int get completedTasks => _tasks.where((task) => task.isTaskCompleted).length;

  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getString(_tasksKey);
      
      if (tasksJson != null) {
        final List<dynamic> tasksList = json.decode(tasksJson);
        _tasks = tasksList.map((taskJson) => TaskItem.fromJson(taskJson)).toList();
      }
    } catch (e) {
      debugPrint('Error loading tasks: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = json.encode(_tasks.map((task) => task.toJson()).toList());
      await prefs.setString(_tasksKey, tasksJson);
    } catch (e) {
      debugPrint('Error saving tasks: $e');
    }
  }

  Future<void> addTask(String title, {String description = ''}) async {
    if (title.trim().isEmpty) return;

    final newTask = TaskItem(
      taskId: DateTime.now().millisecondsSinceEpoch.toString(),
      taskTitle: title.trim(),
      taskDescription: description.trim(),
      dateCreated: DateTime.now(),
    );

    _tasks.add(newTask);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> updateTask(TaskItem updatedTask) async {
    final index = _tasks.indexWhere((task) => task.taskId == updatedTask.taskId);
    if (index != -1) {
      _tasks[index] = updatedTask;
      await _saveTasks();
      notifyListeners();
    }
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    final index = _tasks.indexWhere((task) => task.taskId == taskId);
    if (index != -1) {
      final task = _tasks[index];
      final wasCompleted = task.isTaskCompleted;
      _tasks[index] = task.copyWith(
        isTaskCompleted: !task.isTaskCompleted,
        dateCompleted: !task.isTaskCompleted ? DateTime.now() : null,
      );
      await _saveTasks();
      
      // Trigger celebration animation for task completion
      if (!wasCompleted && _tasks[index].isTaskCompleted) {
        _showCompletionCelebration = true;
        notifyListeners();
        // Reset celebration flag after animation
        Future.delayed(const Duration(milliseconds: 1000), () {
          _showCompletionCelebration = false;
          notifyListeners();
        });
      } else {
        notifyListeners();
      }
    }
  }

  bool _showCompletionCelebration = false;
  bool get showCompletionCelebration => _showCompletionCelebration;

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.taskId == taskId);
    await _saveTasks();
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    _currentFilter = filter;
    notifyListeners();
  }

  Future<void> clearCompleted() async {
    _tasks.removeWhere((task) => task.isTaskCompleted);
    await _saveTasks();
    notifyListeners();
  }
}