import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class RGMap extends StatefulWidget {
  double lat;
  double long;
  Set<Marker>? markers;

  final Set<Marker> set = new Set.from([]);

  RGMap(
      {this.lat = 0.0,
        this.long = 0.0,
        this.markers}
      );

  static RGMapState? of(BuildContext context) => context.findAncestorStateOfType<RGMapState>();

  @override
  State<RGMap> createState() => RGMapState();

}

class RGMapState extends State<RGMap> {
  LatLng camTarget;
  Completer<GoogleMapController> _controller = Completer();//a rm ?
  GoogleMapController? mapController;


  RGMapState({
    //required this.mapController,
    this.camTarget = const LatLng(0.0, 0.0),
});



  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    print('====================');
    print(LatLng(widget.lat, widget.long));

    return GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
        markers: widget.markers ?? new Set<Marker>(),
        onMapCreated: _onMapCreated,
    );
  }

  void setCamera(double lat,double long) {
    mapController?.animateCamera(
      CameraUpdate.newLatLng(
        const LatLng(56.1725505, 10.1850512),
      ),
    );
  }

}