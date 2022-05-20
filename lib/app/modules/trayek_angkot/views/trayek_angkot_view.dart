import 'package:digi_kot/app/core/themes/status_bar_theme.dart';
import 'package:digi_kot/app/core/themes/text_themes.dart';
import 'package:digi_kot/app/core/values/assets.dart';
import 'package:digi_kot/app/core/values/colors.dart';
import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:digi_kot/app/global_widgets/trayek_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/trayek_angkot_controller.dart';

class TrayekAngkotView extends GetView<TrayekAngkotController> {
  @override
  Widget build(BuildContext context) {
    changeStatusBarLightTheme();
    return Scaffold(
      backgroundColor: scaffoldWhite,
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text('Angkot'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: controller.obx(
        (state) => ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trayek Angkot',
                        style: trayekTitlePageTextStyle,
                      ),
                      Text(
                        'Bandung',
                        style: trayekSubtitlePageTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(mediumCarImage),
                    ],
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
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
          ],
        ),
        onLoading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              size: 30,
              color: Colors.black45,
            ),
          ],
        ),
        onError: (error) => Text(error.toString()),
      ),
    );
  }
}
