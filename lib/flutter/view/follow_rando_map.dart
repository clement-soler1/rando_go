import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rando_go/flutter/main.dart';
import 'package:rando_go/flutter/model/Rando.dart';
import 'package:rando_go/flutter/model/Point.dart';




class RGFollowRandoMap extends StatefulWidget {
  static String routeName = '/follow_rando/map';

  Rando randoFollowed;

  RGFollowRandoMap({
    required this.randoFollowed,
});

  @override
  RGFollowRandoMapState createState() => new RGFollowRandoMapState();
}

class RGFollowRandoMapState extends State<RGFollowRandoMap> {

  Location location = new Location();
  LocationData? _locationData;
  GoogleMapController? mapController;

  LatLng endPoint = LatLng(0.0, 0.0);

  @override
  Widget build(BuildContext context) {

    Rando _rando = widget.randoFollowed;
    List<Point> _randoPoints = _rando.points;

  _randoPoints.sort((a, b) => a.number.compareTo(b.number));

    List<LatLng> _points_pos = [];
    _randoPoints.forEach((p) {
      _points_pos.add(LatLng(p.lat, p.long));
    });

    endPoint = _points_pos.last;

    List<Polyline> map_walkway = [];
    List<Marker> map_markers = [];

    Polyline way = Polyline(
      polylineId: new PolylineId("rando_" + _rando.name + "_way"),
      points: _points_pos,
      color: Colors.red,
    );
    map_walkway.add(way);

    Marker end_marker = Marker(
      markerId: MarkerId("pos_marker"),
      position: endPoint,
      icon: customIconRando,

    );

    map_markers.add(end_marker);

    return Scaffold(
      appBar: RGAppBar(),
      //appBar: ,
      body: Stack(
          children : [
            GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
              markers: Set<Marker>.from(map_markers),
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              polylines: Set<Polyline>.from(map_walkway),
            ),
          ]),
      drawer: RGDrawer(),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void initiateLocalisation() async {
    //get the current location

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    location.onLocationChanged.listen((LocationData currentLocation) {

      //detect si a l'arrive
      LatLng cur_pos = LatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);
      //LatLng cur_pos

      if (endPoint.longitude != 0.0 && endPoint.latitude != 0.0) {
        double dist = calculateDistance(endPoint.latitude, endPoint.longitude, cur_pos.latitude, cur_pos.longitude);

        if (dist < 3.0) {
          //TO DO vistory view + back to menu
        }

      }
    });
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  // get the icons
  BitmapDescriptor customIconRando = BitmapDescriptor.defaultMarker;
  // make sure to initialize before map loading
  getIcons() async {

    var iconRando = await BitmapDescriptor.fromAssetImage(
      //47*76
        ImageConfiguration(size: Size(23,38)),
        "images/hike 2.png");

    setState(() {
      this.customIconRando = iconRando;
    });
  }

  @override
  void initState() {
    getIcons();
    initiateLocalisation();
    super.initState();
  }
}