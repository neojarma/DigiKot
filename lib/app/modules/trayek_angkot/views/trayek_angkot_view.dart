import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:digi_kot/app/global_widgets/trayek_list_tile.dart';
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
                var arguments = {no, currentModel};
                Get.toNamed(Routes.DETAIL_TRAYEK, arguments: arguments);
              },
              child: TrayekListTile(
                useMargin: true,
                controller: controller,
                angkotRouteName: title,
                number: no.toString(),
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
