import 'package:flutter/material.dart';
import 'package:rando_go/flutter/all_layout.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPoint extends StatefulWidget {
  static String routeName = '/mappoint';
  @override
  MapPointState createState() => new MapPointState();
}

class MapPointState extends State<MapPoint>{
  Location location = new Location();
  LocationData? _locationData;

  Set<Marker> map_markers = new Set<Marker>();
  Marker pos_marker = Marker(
    markerId: MarkerId("pos_marker"),
    position: LatLng(43.137365, 6.021006),
  );

  RGMap location_map = RGMap();

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
      print("test");
      print(currentLocation);
      LatLng cur_pos = LatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);

      print('b marker');
      map_markers.remove(pos_marker);
      Marker new_pos_marker = Marker(
        markerId: MarkerId("pos_marker"),
        position: cur_pos,
        icon: customIconPos,
      );

      print('o marker');
      pos_marker = new_pos_marker;
      map_markers.add(pos_marker);
      print('e marker');

      print('b goto');
      location_map.setCameraPos(cur_pos);
      print('e goto');

      //location_map.goTo()
    });
  }

  @override
  Widget build(BuildContext context) {

    pos_marker = Marker(
      markerId: MarkerId("pos_marker"),
      position: LatLng(0, 0),
      icon: customIconPos,
    );
    map_markers.add(pos_marker);

    location_map = RGMap(markers: map_markers,);

    return Scaffold(
      appBar: RGAppBar(),
      //appBar: ,
      body: location_map,
      drawer: RGDrawer(),
      bottomNavigationBar: RGBottomBarCreation(),
    );
  }

  BitmapDescriptor customIconPos = BitmapDescriptor.defaultMarker;
  // make sure to initialize before map loading
  getIcons() async {
    //Position custom icon
    var iconPos = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(16,16)),
        "images/position.png");
    setState(() {
      this.customIconPos = iconPos;
    });
  }

  @override
  void initState() {
    getIcons();
    initiateLocalisation();
    super.initState();
  }
}