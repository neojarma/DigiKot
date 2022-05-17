import 'package:digi_kot/app/core/themes/status_bar_theme.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  var pageIndex = 0.obs;
  var isScanPage = false;

  @override
  void onReady() {
    initializeUserPermissions();

    super.onReady();
  }

  @override
  void onInit() {
    ever(
      pageIndex,
      (callback) {
        if (pageIndex.value == 1) {
          changeStatusBarLightTheme();
          return;
        }
        changeStatusBarDarkTheme();
      },
    );

    super.onInit();
  }

  void initializeUserPermissions() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      Permission.location.request();
      return;
    }

    if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void changeIndex(int index) {
    pageIndex.value = index;

    if (pageIndex.value == 1) {
      isScanPage = true;
    } else {
      isScanPage = false;
    }
  }

  Future<bool> handlePage() async {
    // if not scanpage close the app
    if (!isScanPage) return true;

    // if scan page, change the index
    changeIndex(0);
    return false;
  }
}
