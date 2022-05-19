import 'package:flutter/material.dart';

import '../core/themes/text_themes.dart';
import '../core/values/colors.dart';

class TrayekListTile extends StatelessWidget {
  const TrayekListTile({
    Key? key,
    required this.controller,
    required this.angkotRouteName,
    required this.number,
    required this.useMargin,
    this.trailing,
  }) : super(key: key);

  final dynamic controller;
  final Widget? trailing;
  final String number;
  final String angkotRouteName;
  final bool useMargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        margin: (useMargin)
            ? EdgeInsets.symmetric(horizontal: 10, vertical: 4)
            : null,
        elevation: 2,
        child: Center(
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  number,
                  style: trayekPageTextStyle,
                ),
              ),
            ),
            title: Text(
              angkotRouteName,
              style: trayekPageTextStyle.copyWith(
                color: Colors.black,
              ),
            ),
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
