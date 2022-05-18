import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/trayek_angkot_controller.dart';

class TrayekAngkotView extends GetView<TrayekAngkotController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrayekAngkotView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.angkotRoutes?[0].routeLength,
          itemBuilder: (context, index) {
            int no = index + 1;
            String title = controller.angkotRoutes?[index].routeName ?? '';
            AngkotRoute currentModel = controller.angkotRoutes![index];

            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.DETAIL_TRAYEK, arguments: currentModel);
              },
              child: ListTile(
                leading: Text(no.toString()),
                title: Text(title),
                trailing: Icon(Icons.arrow_right),
              ),
            );
          },
        ),
        onError: (error) => Text(error.toString()),
      ),
    );
  }
}
