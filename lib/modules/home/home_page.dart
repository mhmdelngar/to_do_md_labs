import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/modules/home/widgets/home_page_list.dart';
import 'package:to_do/modules/home/widgets/home_page_text_field.dart';

import './home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text("To-Do List")),
        body: const Column(
          children: [
            HomePageTextField(),
            HomePageList(),
          ],
        ),
      );
    });
  }
}
