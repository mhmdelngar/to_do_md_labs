
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do/business/helpers/base_controller.dart';
import 'package:to_do/business/models/task_model.dart';
import 'package:to_do/business/repos/task_repo.dart';

class HomeController extends BaseGetxController {
  @override
  void onInit() {
    super.onInit();
    _init();
  }

  TextEditingController controllerText = TextEditingController();

  final TaskRepository _taskRepository = Get.find<TaskRepository>();

  // Observable list of tasks
  var tasks = <Task>[].obs;

  void _init() {
    super.onInit();
    _initializeTasks();
  }

  Future<void> _initializeTasks() async {
    await _taskRepository.init();
    loadTasks();
  }

  void loadTasks() {
    tasks.assignAll(_taskRepository.getTasks());
  }

  Future<void> addTask(String title) async {
    final Task newTask = await _taskRepository.addTask(title);
    tasks.add(newTask);
  }

  Future<void> toggleTaskCompletion(String id) async {
    final index = tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      final updatedTask = tasks[index];
      updatedTask.isCompleted = !updatedTask.isCompleted;
      tasks[index] = updatedTask;
      try {
        await _taskRepository.updateTask(updatedTask);
      } catch (e) {
        updatedTask.isCompleted = !updatedTask.isCompleted;
        tasks[index] = updatedTask;
      }
    }
  }

  Future<void> deleteTask(String id) async {
    await _taskRepository.deleteTask(id);
    tasks.removeWhere((task) => task.id == id);
  }

  Future<void> clearAllTasks() async {
    await _taskRepository.clearAllTasks();
    tasks.clear();
  }
}
