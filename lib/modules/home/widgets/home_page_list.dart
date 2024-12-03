import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/modules/home/widgets/home_page_list_task_item.dart';

import '../home_controller.dart';

class HomePageList extends StatelessWidget {
  const HomePageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Obx(() {
        return Expanded(
          child: ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) {
              final task = controller.tasks[index];
              return HomePageListTaskItem(task: task);
            },
          ),
        );
      });
    });
  }
}
