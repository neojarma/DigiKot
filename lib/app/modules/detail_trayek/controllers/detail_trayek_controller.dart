import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailTrayekController extends GetxController {
  Set prevArgs = Get.arguments;

  late AngkotRoute angkotRoute;
  late int number;
  Set<Marker> markers = {};

  @override
  void onInit() {
    initializeData();
    initializeMarker();
    super.onInit();
  }

  void initializeData() {
    number = prevArgs.elementAt(0);
    angkotRoute = prevArgs.elementAt(1);
  }

  void initializeMarker() {
    // origin marker
    markers.add(
      Marker(
        markerId: MarkerId('origin_marker'),
        position: angkotRoute.origin,
      ),
    );

    // destination marker
    markers.add(
      Marker(
        markerId: MarkerId('destination_marker'),
        position: angkotRoute.destination,
      ),
    );

    // all waypoint
    angkotRoute.routesPointLatlng
        .map(
          (latlng) => Marker(
            markerId: MarkerId(latlng.hashCode.toString()),
            position: latlng,
          ),
        )
        .toSet()
        .forEach((marker) => markers.add(marker));
  }
}
