import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationProvider {
  static final _connect = GetConnect();
  static final _apiKey = dotenv.get('MAP_QUEST_API_KEY');
  static final _uri = 'http://www.mapquestapi.com/geocoding/v1/address';

  static Future<LatLng> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    double latitude = position.latitude;
    double longitude = position.longitude;

    return LatLng(latitude, longitude);
  }

  static Future<LatLng> getLocationFrom(String placeName) async {
    final uri = '$_uri?key=$_apiKey&location=$placeName';
    return await _connect.get(uri).then((value) {
      final double lat =
          value.body['results'][0]['locations'][0]['latLng']['lat'];
      final double lng =
          value.body['results'][0]['locations'][0]['latLng']['lng'];
      return LatLng(lat, lng);
    });
  }
}
