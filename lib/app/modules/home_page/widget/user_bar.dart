import 'package:flutter/material.dart';

import '../../../core/themes/text_themes.dart';

class UserHomeBar extends StatelessWidget {
  const UserHomeBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/digikot-75c26.appspot.com/o/Shiroko.png?alt=media&token=3fc8dbd0-a3f6-4279-ba47-5a3515cd0958',
          ).image,
          radius: 30,
        ),
        SizedBox(
          width: 13,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, John!',
              style: homePageTexStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Selamat datang',
              style: homePageTexStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.notifications,
              size: 33,
            ),
          ),
        ),
      ],
    );
  }
}
