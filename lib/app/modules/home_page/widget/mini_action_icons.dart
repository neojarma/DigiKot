import 'package:flutter/material.dart';

import '../../../core/themes/text_themes.dart';

class MiniActionIcon extends StatelessWidget {
  const MiniActionIcon({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white),
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: homePageTexStyle.copyWith(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
