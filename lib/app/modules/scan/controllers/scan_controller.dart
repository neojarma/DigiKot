import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanController extends GetxController {
  late MobileScannerController mobileScannerController;
  String? barcodeValue;

  @override
  void onInit() {
    mobileScannerController = MobileScannerController();

    super.onInit();
  }

  dynamic onDetect(
      Barcode barcode, MobileScannerArguments? mobileScannerArguments) {
    if (barcode.rawValue == null) {
      Get.snackbar('failed', 'failed');
    } else {
      Get.snackbar('Barcode Found', 'barcode found');
      final String code = barcode.rawValue!;
      barcodeValue = code;
      // Get.toNamed(Routes.HOME);
      // mobileScannerController.dispose();
    }
  }
}
