import 'dart:ui';

import 'package:digi_kot/app/core/themes/text_themes.dart';
import 'package:digi_kot/app/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: darkBlue,
              height: Get.height,
              clipBehavior: Clip.none,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MobileScanner(
                          fit: BoxFit.cover,
                          allowDuplicates: false,
                          controller: controller.mobileScannerController,
                          onDetect: controller.onDetect,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Scan QR Code',
                    style: homePageTexStyle.copyWith(color: Colors.white),
                  ),
                  Text(
                    'Letakkan QR Code pada Scan Area',
                    style: homePageTexStyle.copyWith(
                        color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
