import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class Directions {
  final LatLngBounds latLngBounds;
  final List<PointLatLng> polylinePoint;

  Directions({required this.latLngBounds, required this.polylinePoint});

  factory Directions.fromJson(Map<String, dynamic> json) {
    var jsonPoly = json['route']['shape']['shapePoints'];
    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> polyline = polylinePoints.decodePolyline(jsonPoly);

    var lr = LatLng(json['route']['boundingBox']['lr']['lat'],
        json['route']['boundingBox']['lr']['lng']);
    var ul = LatLng(json['route']['boundingBox']['ul']['lat'],
        json['route']['boundingBox']['ul']['lng']);
    return Directions(
        latLngBounds: LatLngBounds(southwest: lr, northeast: ul),
        polylinePoint: polyline);
  }
}
