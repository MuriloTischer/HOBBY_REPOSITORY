import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBidings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        loginService: Get.find(),
      ),
      fenix: true,
    );
  }
}
