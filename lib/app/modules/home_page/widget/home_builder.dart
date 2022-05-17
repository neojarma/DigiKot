import 'package:digi_kot/app/modules/home_page/widget/user_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_page_controller.dart';
import 'destination.dart';
import 'home_menu_box.dart';
import 'user_maps.dart';

class HomeBuilder extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserHomeBar(),
              HomeMenuBox(),
              Destination(),
              UserMaps(),
            ],
          ),
        ),
      ),
    );
  }
}
