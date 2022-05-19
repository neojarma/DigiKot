import 'package:digi_kot/app/core/themes/text_themes.dart';
import 'package:digi_kot/app/core/values/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../global_widgets/trayek_list_tile.dart';
import '../controllers/detail_trayek_controller.dart';

class DetailTrayekView extends GetView<DetailTrayekController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldWhite,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: 250,
            flexibleSpace: GoogleMap(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer()),
              },
              initialCameraPosition: CameraPosition(
                target: controller.angkotRoute.routesPointLatlng[0],
                zoom: 17,
              ),
              polylines: {
                Polyline(
                  polylineId: PolylineId(controller.angkotRoute.routeName),
                  width: 4,
                  points: controller.angkotRoute.routesPointLatlng,
                ),
              },
              markers: controller.markers,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TrayekListTile(
                  useMargin: false,
                  controller: controller,
                  angkotRouteName: controller.angkotRoute.routeName,
                  number: controller.number.toString(),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 10),
                  child: Text(
                    'Rute',
                    style: trayekPageTextStyle.copyWith(
                        color: Colors.black, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                height: 40,
                padding: EdgeInsets.only(left: 10),
                color: Colors.white,
                child: TimelineTile(
                  indicatorStyle: IndicatorStyle(
                    color: darkBlue,
                    width: 15,
                  ),
                  endChild: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      controller.angkotRoute.routePointsName[index],
                      style: trayekPageTextStyle.copyWith(color: Colors.black),
                    ),
                  ),
                  isFirst: (index == 0),
                  isLast: (index ==
                      controller.angkotRoute.routePointsName.length - 1),
                ),
              ),
              childCount: controller.angkotRoute.routePointsName.length,
            ),
          )
        ],
      ),
    );
  }
}
