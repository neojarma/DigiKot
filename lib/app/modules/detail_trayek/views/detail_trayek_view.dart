import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/detail_trayek_controller.dart';

class DetailTrayekView extends GetView<DetailTrayekController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: 300,
            flexibleSpace: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(32.123, -321.232),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: controller.angkotRoute.routePointsName.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.angkotRoute.routePointsName[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
