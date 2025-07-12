/// Represents a task item in the application.
/// 
/// A task contains all the necessary information to track and manage
/// a user's task including its status, creation time, and completion details.
class TaskItem {
  final String taskId;
  
  final String taskTitle;
  
  final String taskDescription;
  
  final bool isTaskCompleted;
  
  final DateTime dateCreated;
  
  final DateTime? dateCompleted;

  const TaskItem({
    required this.taskId,
    required this.taskTitle,
    this.taskDescription = '',
    this.isTaskCompleted = false,
    required this.dateCreated,
    this.dateCompleted,
  });

  /// Creates a copy of this task with the given fields replaced by new values.
  TaskItem copyWith({
    String? taskId,
    String? taskTitle,
    String? taskDescription,
    bool? isTaskCompleted,
    DateTime? dateCreated,
    DateTime? dateCompleted,
  }) {
    return TaskItem(
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
      dateCreated: dateCreated ?? this.dateCreated,
      dateCompleted: dateCompleted ?? this.dateCompleted,
    );
  }

  /// Converts the task to a JSON map for storage or transmission.
  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'task_title': taskTitle,
      'task_description': taskDescription,
      'is_task_completed': isTaskCompleted,
      'date_created': dateCreated.millisecondsSinceEpoch,
      'date_completed': dateCompleted?.millisecondsSinceEpoch,
    };
  }

  /// Creates a TaskItem from a JSON map.
  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      taskId: json['task_id'] as String,
      taskTitle: json['task_title'] as String,
      taskDescription: json['task_description'] as String? ?? '',
      isTaskCompleted: json['is_task_completed'] as bool? ?? false,
      dateCreated: DateTime.fromMillisecondsSinceEpoch(json['date_created'] as int),
      dateCompleted: json['date_completed'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date_completed'] as int)
          : null,
    );
  }

  /// Marks the task as completed with the current timestamp.
  TaskItem markAsCompleted() {
    return copyWith(
      isTaskCompleted: true,
      dateCompleted: DateTime.now(),
    );
  }

  /// Marks the task as incomplete by clearing the completion date.
  TaskItem markAsIncomplete() {
    return copyWith(
      isTaskCompleted: false,
      dateCompleted: null,
    );
  }

  /// Returns the duration since the task was created.
  Duration get timeSinceCreation => DateTime.now().difference(dateCreated);

  /// Returns the duration the task took to complete (null if not completed).
  Duration? get completionDuration => dateCompleted != null 
      ? dateCompleted!.difference(dateCreated) 
      : null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskItem && other.taskId == taskId;
  }

  @override
  int get hashCode => taskId.hashCode;

  @override
  String toString() {
    return 'TaskItem(taskId: $taskId, taskTitle: $taskTitle, isTaskCompleted: $isTaskCompleted)';
  }
}