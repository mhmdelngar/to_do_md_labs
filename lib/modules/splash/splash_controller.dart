import 'package:get/get.dart';
import 'package:to_do/business/helpers/base_controller.dart';

class SplashController extends BaseGetxController {
  @override
  void onInit() {
    super.onInit();
    _init();
  }

  Future<void> _init() async {
    Future.delayed(const Duration(seconds: 5), () {
      // Navigate to the main screen after 5 seconds
      Get.offNamed('/home'); // Replace MainScreen with your actual screen
    });
  }
}
