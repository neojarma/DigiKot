import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:digi_kot/app/data/provider/angkot_route_provider.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';

class TrayekAngkotController extends GetxController with StateMixin {
  List<AngkotRoute>? angkotRoutes;

  @override
  void onInit() {
    initializeData();

    super.onInit();
  }

  @override
  void onClose() {
    // change index of home controller
    final homeController = Get.find<HomeController>();
    homeController.changeIndex(0);

    super.onClose();
  }

  void initializeData() async {
    change('loading', status: RxStatus.loading());

    angkotRoutes = await AngkotRouteProvider.getAngkotRoute();
    if (angkotRoutes == null) {
      change('error', status: RxStatus.error());
      return;
    }

    change('ok', status: RxStatus.success());
  }
}
