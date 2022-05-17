import 'package:digi_kot/app/core/values/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import '../widget/home_builder.dart';

class HomePageView extends GetView<HomePageController> {
  static const _radius = 50.0;
  final _containerHeight = Get.height * 0.85;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: Container(
        // to change status bar color
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(_radius),
            bottomLeft: Radius.circular(_radius),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: SafeArea(
          child: Container(
            height: _containerHeight,
            color: Colors.white,
            child: HomeBuilder(),
          ),
        ),
      ),
    );
  }
}
