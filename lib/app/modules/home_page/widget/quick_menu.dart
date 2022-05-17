import 'package:flutter/material.dart';

import '../../../core/themes/text_themes.dart';
import 'mini_action_icons.dart';

class QuickMenu extends StatelessWidget {
  const QuickMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Saldo',
              style: homePageTexStyle.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              'Rp. 523.000',
              style: homePageTexStyle.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        Spacer(),
        MiniActionIcon(
          icon: Icons.arrow_upward_sharp,
          title: 'Transfer',
        ),
        SizedBox(
          width: 16,
        ),
        MiniActionIcon(
          icon: Icons.add,
          title: 'Isi Saldo',
        )
      ],
    );
  }
}
