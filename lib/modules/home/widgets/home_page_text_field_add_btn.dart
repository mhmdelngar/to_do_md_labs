import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class HomePageTextFieldAddBtn extends StatelessWidget {
  const HomePageTextFieldAddBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          if (controller.controllerText.text.isNotEmpty) {
            controller.addTask(controller.controllerText.text);
            controller.controllerText.clear();
          }
        },
      );
    });
  }
}
