import 'package:digi_kot/app/data/provider/location_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageController extends GetxController with StateMixin {
  late CameraPosition initialCameraPosition;
  late final LatLng firstPosition;

  late final TextEditingController destinationFromController;
  late final TextEditingController destinationToController;

  late GoogleMapController mapController;

  Marker? markerFrom;
  Marker? markerTo;

  @override
  void onInit() {
    initializeTextFieldController();

    initializeUserCurrentLocation();

    super.onInit();
  }

  void initializeMapController(GoogleMapController controller) {
    mapController = controller;
  }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void handleUerRouteRequest() async {
    closeKeyboard();

    LatLng from;
    if (destinationFromController.text.isEmpty) {
      from = firstPosition;
    } else {
      var coords = await LocationProvider.getLocationFrom(
          destinationFromController.text);
      from = coords;
    }

    LatLng to =
        await LocationProvider.getLocationFrom(destinationToController.text);

    print(from);
    print(to);
  }

  void initializeTextFieldController() {
    destinationFromController = TextEditingController();

    destinationToController = TextEditingController();
  }

  void initializeUserCurrentLocation() async {
    change('Loading', status: RxStatus.loading());

    firstPosition = await LocationProvider.getCurrentLocation();
    initialCameraPosition = CameraPosition(target: firstPosition, zoom: 20);

    change('OK', status: RxStatus.success());
  }
}
