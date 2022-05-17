import 'package:get/get.dart';

import 'package:digi_kot/app/modules/history/bindings/history_binding.dart';
import 'package:digi_kot/app/modules/history/views/history_view.dart';
import 'package:digi_kot/app/modules/home/bindings/home_binding.dart';
import 'package:digi_kot/app/modules/home/views/home_view.dart';
import 'package:digi_kot/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:digi_kot/app/modules/home_page/views/home_page_view.dart';
import 'package:digi_kot/app/modules/scan/bindings/scan_binding.dart';
import 'package:digi_kot/app/modules/scan/views/scan_view.dart';
import 'package:digi_kot/app/modules/splash_screen/bindings/splash_screen_binding.dart';
import 'package:digi_kot/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:digi_kot/app/modules/user_account/bindings/user_account_binding.dart';
import 'package:digi_kot/app/modules/user_account/views/user_account_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME, page: () => HomeView(),
      // binding: HomeBinding(),
      bindings: [
        HomeBinding(),
        ScanBinding(),
        HomePageBinding(),
        UserAccountBinding(),
        HistoryBinding(),
      ],
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.USER_ACCOUNT,
      page: () => UserAccountView(),
      binding: UserAccountBinding(),
    ),
  ];
}
