import 'package:digi_kot/app/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkBlue,
        height: Get.height,
        clipBehavior: Clip.none,
      ),
    );
  }
}
