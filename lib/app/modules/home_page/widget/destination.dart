import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/themes/text_themes.dart';
import '../../../core/values/colors.dart';
import '../controllers/home_page_controller.dart';

class Destination extends GetView<HomePageController> {
  const Destination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Mau Kemana ? ',
          style: homePageTexStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        destinationBox(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Container destinationBox() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 112,
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leftPanel(),
          textFieldPanel(),
          findDestinationIcon(),
        ],
      ),
    );
  }

  Container findDestinationIcon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(7),
      ),
      child: GestureDetector(
        onTap: controller.handleUerRouteRequest,
        child: Icon(
          Icons.arrow_right_alt,
          size: 33,
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded textFieldPanel() {
    return Expanded(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller.destinationFromController,
              style: TextStyle(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Lokasi Anda',
                hintStyle: TextStyle(color: Colors.white),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                border: InputBorder.none,
              ),
              onSubmitted: (value) => print(value),
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 11,
              endIndent: 20,
            ),
            TextField(
              controller: controller.destinationToController,
              style: TextStyle(fontSize: 15, color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Tujuan Anda',
                hintStyle: TextStyle(color: Colors.white54),
                contentPadding: EdgeInsets.all(10),
                isDense: true,
                border: InputBorder.none,
              ),
              onSubmitted: (value) => print(value),
            ),
          ],
        ),
      ),
    );
  }

  Column leftPanel() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 5,
        ),
        Expanded(
          child: VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 3,
            endIndent: 3,
            color: Colors.white54,
          ),
        ),
        Container(
          width: 9,
          height: 9,
          color: Colors.grey,
        )
      ],
    );
  }
}
