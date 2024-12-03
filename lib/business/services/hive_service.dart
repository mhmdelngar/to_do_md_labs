import 'package:hive/hive.dart';
import 'package:to_do/business/models/task_model.dart';

class HiveService {
  late Box<Task> _taskBox;
  final String boxName;

  HiveService({required this.boxName});

  Future<void> init() async {
    Hive.registerAdapter(TaskAdapter());
    _taskBox = await Hive.openBox<Task>(boxName);
  }

  // Add task with automatic ID generation
  Future<Task> addTask(String title) async {
    final newTask = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    await _taskBox.put(newTask.id, newTask);

    return newTask;
  }



  List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  Future<void> updateTask(Task newTask) async {
    final task = _taskBox.get(newTask.id);
    if (task != null) {
      task.isCompleted = newTask.isCompleted;
      task.save();
    }
  }

  Future<void> deleteTask(String id) async {
    await _taskBox.delete(id);
  }

  Future<void> clearAllTasks() async {
    await _taskBox.clear();
  }
}
