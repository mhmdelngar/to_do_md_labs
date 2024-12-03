import 'package:to_do/business/repos/task_repo.dart';
import 'package:to_do/business/services/hive_service.dart';

import './home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HiveService(boxName: 'tasks'));
    Get.lazyPut(() => TaskRepository(hiveService: Get.find()));
  }
}
