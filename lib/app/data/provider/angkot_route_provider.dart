import 'package:digi_kot/app/data/model/angkot_route_model.dart';
import 'package:get/get_connect.dart';

abstract class AngkotRouteProvider {
  static final _connect = GetConnect();
  static final _baseUrl = 'https://angkot-bandung-api.vercel.app/v1/data';

  static Future<List<AngkotRoute>> getAngkotRoute() async {
    final request = await _connect.get(_baseUrl);

    final List list = request.body['result'] as List;
    return list.map((e) => AngkotRoute.fromJson(e, list.length)).toList();
  }
}
