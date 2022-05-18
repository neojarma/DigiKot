import 'package:get/get.dart';

import '../modules/detail_trayek/bindings/detail_trayek_binding.dart';
import '../modules/detail_trayek/views/detail_trayek_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_page/bindings/home_page_binding.dart';
import '../modules/home_page/views/home_page_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/trayek_angkot/bindings/trayek_angkot_binding.dart';
import '../modules/trayek_angkot/views/trayek_angkot_view.dart';
import '../modules/user_account/bindings/user_account_binding.dart';
import '../modules/user_account/views/user_account_view.dart';

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
    GetPage(
      name: _Paths.TRAYEK_ANGKOT,
      page: () => TrayekAngkotView(),
      binding: TrayekAngkotBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_TRAYEK,
      page: () => DetailTrayekView(),
      binding: DetailTrayekBinding(),
    ),
  ];
}
