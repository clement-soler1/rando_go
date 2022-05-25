import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/**
    Usage example RGMap(lat: 0.0,long: 0.0)
    Position camera de base sur la fac bat W
 */

class RGMap extends StatefulWidget {
  double lat;
  double long;


  RGMap(
      {this.lat = 43.137365,
        this.long = 6.021006}
      );

  @override
  State<RGMap> createState() => RGMapState();
}

class RGMapState extends State<RGMap> {
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(43.137365, 6.021006),
    zoom: 14.4746,
  );

  /*static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/

  @override
  Widget build(BuildContext context) {

    _kGooglePlex = CameraPosition(
      target: LatLng(widget.lat, widget.long),
      zoom: 14.4746,
    );

    return GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
    );
  }

  /*Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }*/
}