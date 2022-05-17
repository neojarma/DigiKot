import 'package:digi_kot/app/modules/home_page/widget/single_menu_builder.dart';
import 'package:flutter/material.dart';

import '../../../core/values/assets.dart';
import '../../../core/values/colors.dart';
import 'quick_menu.dart';

class HomeMenuBox extends StatelessWidget {
  const HomeMenuBox({Key? key}) : super(key: key);

  Row homeMenus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SingleMenuBuilder(
          image: Image.asset(carImage),
          title: 'Angkot',
        ),
        SingleMenuBuilder(
          image: Image.asset(bus),
          title: 'Bus Kota',
        ),
        SingleMenuBuilder(
          image: Image.asset(map),
          title: 'Maps',
        ),
        SingleMenuBuilder(
          image: Image.asset(others),
          title: 'Lainnya',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(44),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(smallLogo),
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          QuickMenu(),
          SizedBox(
            height: 20,
          ),
          homeMenus(),
        ],
      ),
    );
  }
}
