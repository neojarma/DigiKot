import 'package:digi_kot/app/core/themes/status_bar_theme.dart';
import 'package:digi_kot/app/core/themes/text_themes.dart';
import 'package:digi_kot/app/core/values/assets.dart';
import 'package:digi_kot/app/core/values/colors.dart';
import 'package:digi_kot/app/core/values/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    changeStatusBarLightTheme();
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Flexible(
              child: Image.asset(logo),
            ),
            SizedBox(
              height: 70,
            ),
            Flexible(
              child: Image.asset(undrawWalletImage),
            ),
            splashScreenText(),
            ElevatedButton(
              onPressed: controller.navigatePage,
              child: Text(
                splashButtonText,
                style: textButtonStyle,
              ),
              style: ElevatedButton.styleFrom(
                primary: blue,
                minimumSize: Size(Get.width * 0.7, 58),
              ),
            )
          ],
        ),
      ),
    );
  }

  Flexible splashScreenText() {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleSplashScreen,
            style: splashScreenTitleStyle,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            descSplashScreen,
            style: splashScreenDescStyle,
          ),
        ],
      ),
    );
  }
}
