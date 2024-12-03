import 'package:to_do/business/models/task_model.dart';
import 'package:to_do/business/services/hive_service.dart';



class TaskRepository {
  final HiveService _hiveService;

  TaskRepository({required HiveService hiveService}) : _hiveService = hiveService;

  Future<void> init() async {
    await _hiveService.init();
  }

  Future<Task> addTask(String title) async {
    return await _hiveService.addTask(title);
  }

  List<Task> getTasks() {
    return _hiveService.getAllTasks();
  }

  Future<void> updateTask(Task newTask) async {
    await _hiveService.updateTask(newTask);
  }

  Future<void> deleteTask(String id) async {
    await _hiveService.deleteTask(id);
  }

  Future<void> clearAllTasks() async {
    await _hiveService.clearAllTasks();
  }
}
