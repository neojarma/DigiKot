import 'package:get/get.dart';

import '../controllers/trayek_angkot_controller.dart';

class TrayekAngkotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrayekAngkotController>(
      () => TrayekAngkotController(),
    );
  }
}
