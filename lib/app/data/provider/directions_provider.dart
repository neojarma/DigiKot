import 'package:digi_kot/app/data/model/directions_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class DirectionProvider {
  static final _connect = GetConnect();
  static final _apiKey = dotenv.get('MAP_QUEST_API_KEY');
  static final _baseUrl = 'http://www.mapquestapi.com/directions/v2/route';

  static Future<Directions> getDirections(
      String origin, String destination) async {
    var url = '$_baseUrl?key=$_apiKey';

    var body = {
      "locations": [
        origin,
        destination,
      ],
      "options": {
        "avoids": [],
        "avoidTimedConditions": false,
        "doReverseGeocode": true,
        "shapeFormat": "cmp",
        "generalize": 0,
        "routeType": "fastest",
        "timeType": 1,
        "locale": "en_US",
        "unit": "m",
        "enhancedNarrative": false,
        "drivingStyle": 2,
        "highwayEfficiency": 21.0
      }
    };

    return _connect.post(url, body).then((value) {
      print(value.body);
      return Directions.fromJson(value.body);
    });
  }
}
