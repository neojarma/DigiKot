import 'package:digi_kot/app/data/model/directions_model.dart';
import 'package:digi_kot/app/data/provider/directions_provider.dart';
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

  Set<Marker> markers = {};

  Directions? directions;

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

    if (destinationFromController.text.isEmpty &&
        destinationToController.text.isEmpty) {
      markers = {};
      refresh();
      return;
    }

    if (destinationFromController.text.isNotEmpty &&
        destinationToController.text.isEmpty) {
      Get.snackbar('Destination', 'Please input your destination');
      return;
    }

    change('loading', status: RxStatus.loading());

    directions = await DirectionProvider.getDirections(
        destinationFromController.text, destinationToController.text);

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

    // create marker
    markers.add(
      Marker(
        markerId: MarkerId('from'),
        position: from,
      ),
    );
    markers.add(
      Marker(
        markerId: MarkerId('to'),
        position: to,
      ),
    );

    // update google maps camera position
    initialCameraPosition = CameraPosition(target: from, zoom: 17);

    resetTextController();

    change('OK', status: RxStatus.success());

    refresh();
  }

  void resetTextController() {
    destinationFromController.clear();
    destinationToController.clear();
  }

  void initializeTextFieldController() {
    destinationFromController = TextEditingController();

    destinationToController = TextEditingController();
  }

  void initializeUserCurrentLocation() async {
    change('Loading', status: RxStatus.loading());

    firstPosition = await LocationProvider.getCurrentLocation();
    initialCameraPosition = CameraPosition(target: firstPosition, zoom: 17);

    change('OK', status: RxStatus.success());
  }
}
