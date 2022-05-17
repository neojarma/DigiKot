import 'package:flutter/material.dart';

import '../../../core/themes/text_themes.dart';

class SingleMenuBuilder extends StatelessWidget {
  const SingleMenuBuilder({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: image,
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
