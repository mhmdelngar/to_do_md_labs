import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/modules/home/widgets/home_page_text_field_add_btn.dart';
import 'package:to_do/modules/home/widgets/home_page_text_field_data.dart';

import '../home_controller.dart';

class HomePageTextField extends StatelessWidget {
  const HomePageTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            HomePageTextFieldData(),
            HomePageTextFieldAddBtn(),
          ],
        ),
      );
    });
  }
}
