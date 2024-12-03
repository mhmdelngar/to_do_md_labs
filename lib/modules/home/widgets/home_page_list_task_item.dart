import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/business/models/task_model.dart';

import '../home_controller.dart';

class HomePageListTaskItem extends StatelessWidget {
  const HomePageListTaskItem({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return ListTile(
        title: Text(task.title),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            controller.toggleTaskCompletion(task.id);
          },
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => controller.deleteTask(task.id),
        ),
      );
    });
  }
}
