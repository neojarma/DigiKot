import 'package:google_maps_flutter/google_maps_flutter.dart';

class AngkotRoute {
  int routeLength;
  String routeName;
  LatLng origin;
  LatLng destination;
  List<String> routePointsName;
  List<LatLng> routesPointLatlng;

  AngkotRoute({
    required this.routeLength,
    required this.routeName,
    required this.origin,
    required this.destination,
    required this.routePointsName,
    required this.routesPointLatlng,
  });

  factory AngkotRoute.fromJson(Map<String, dynamic> json, int listLength) {
    try {
      int routeLength = listLength;

      String routeName = json['destination'];

      double originLat = json['latlangDestionation']['origin']['lat'];
      double originLng = json['latlangDestionation']['origin']['lng'];
      LatLng origin = LatLng(originLat, originLng);

      double destinationLat = json['latlangDestionation']['destination']['lat'];
      double destinationLng = json['latlangDestionation']['destination']['lng'];
      LatLng destination = LatLng(destinationLat, destinationLng);

      List<dynamic> temp = json['routes'];
      List<String> routePointsName = temp.map((e) => e.toString()).toList();

      List tempList = json['latLangRoutes'] as List;
      List<LatLng> routesPointLatlng =
          tempList.map((value) => LatLng(value['lat'], value['lng'])).toList();

      return AngkotRoute(
        routeLength: routeLength,
        routeName: routeName,
        origin: origin,
        destination: destination,
        routePointsName: routePointsName,
        routesPointLatlng: routesPointLatlng,
      );
    } catch (e) {
      return AngkotRoute(
        routeLength: 0,
        routeName: '',
        origin: LatLng(0, 0),
        destination: LatLng(0, 0),
        routePointsName: [],
        routesPointLatlng: [],
      );
    }
  }
}
