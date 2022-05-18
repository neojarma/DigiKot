import 'package:get/get.dart';

import '../controllers/detail_trayek_controller.dart';

class DetailTrayekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTrayekController>(
      () => DetailTrayekController(),
    );
  }
}
