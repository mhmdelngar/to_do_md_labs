import 'package:hive/hive.dart';

part 'task_model.g.dart'; // Required for Hive type adapter generation

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  // Convert Task to Map (if needed)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  // Create Task from Map (if needed)
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as String,
      title: map['title'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }
  // Factory method to create a new Task with a time-based ID
  factory Task.newTask(String title) {
    return Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Using the current timestamp as the ID
      title: title,
      isCompleted: false,
    );
  }
}