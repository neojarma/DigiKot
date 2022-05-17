import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_account_controller.dart';

class UserAccountView extends GetView<UserAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('UserAccountView'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Text(
          'UserAccountView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
