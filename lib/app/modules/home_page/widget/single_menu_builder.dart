import 'package:flutter/material.dart';

import '../../../core/themes/text_themes.dart';

class SingleMenuBuilder extends StatelessWidget {
  const SingleMenuBuilder({
    Key? key,
    required this.image,
    required this.title,
    required this.function,
  }) : super(key: key);

  final String title;
  final Image image;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: function,
          child: Container(
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
