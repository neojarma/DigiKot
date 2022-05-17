import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/values/colors.dart';
import '../controllers/home_page_controller.dart';

class UserMaps extends GetView<HomePageController> {
  const UserMaps({
    Key? key,
  }) : super(key: key);

  static final _mapsWidth = Get.width * 0.85;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => Container(
        height: 150,
        width: _mapsWidth,
        decoration: BoxDecoration(
          border: Border.all(color: darkBlue, width: 3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: controller.initialCameraPosition,
            // onMapCreated: (mapControl) => controller.mapController = mapControl,
            onMapCreated: controller.initializeMapController,
          ),
        ),
      ),
      onLoading: loadingMaps(),
    );
  }

  Container loadingMaps() {
    return Container(
      height: 150,
      width: Get.width * 0.85,
      decoration: BoxDecoration(
        color: darkBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SpinKitFadingCircle(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
