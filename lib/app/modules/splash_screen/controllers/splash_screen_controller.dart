import 'package:digi_kot/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  void navigatePage() {
    Get.offAndToNamed(Routes.HOME);
  }
}
