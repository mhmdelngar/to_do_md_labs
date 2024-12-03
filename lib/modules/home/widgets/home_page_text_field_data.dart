import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';

class HomePageTextFieldData extends StatelessWidget {
  const HomePageTextFieldData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Expanded(
        child: TextField(
          controller: controller.controllerText,
          decoration: const InputDecoration(hintText: 'Enter task'),
        ),
      );
    });
  }
}
