import 'package:digi_kot/app/core/themes/status_bar_theme.dart';
import 'package:digi_kot/app/core/themes/text_themes.dart';
import 'package:digi_kot/app/core/values/colors.dart';
import 'package:digi_kot/app/modules/history/views/history_view.dart';
import 'package:digi_kot/app/modules/home_page/views/home_page_view.dart';
import 'package:digi_kot/app/modules/scan/views/scan_view.dart';
import 'package:digi_kot/app/modules/user_account/views/user_account_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final _navigationBarHeight = Get.height * 0.1;

  @override
  Widget build(BuildContext context) {
    changeStatusBarDarkTheme();

    return WillPopScope(
      onWillPop: controller.handlePage,
      child: Obx(
        () => Scaffold(
          backgroundColor: darkBlue,
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              HomePageView(),
              ScanView(),
              HistoryView(),
              UserAccountView(),
            ],
          ),
          bottomNavigationBar:
              (controller.isScanPage) ? SizedBox.shrink() : navigationBar(),
        ),
      ),
    );
  }

  Container navigationBar() {
    return Container(
      height: _navigationBarHeight,
      child: BottomNavigationBar(
        currentIndex: controller.pageIndex.value,
        type: BottomNavigationBarType.fixed,
        backgroundColor: darkBlue,
        selectedItemColor: blue,
        unselectedLabelStyle: navigationBarTextStyle,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: navigationBarTextStyle.copyWith(color: darkBlue),
        onTap: controller.changeIndex,
        items: navigationBarItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Beranda',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.qr_code_scanner),
        label: 'Scan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.history_outlined),
        label: 'Riwayat',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: 'Account',
      ),
    ];
  }
}
