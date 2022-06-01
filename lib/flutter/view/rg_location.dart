import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker_updates.dart';
import 'package:rando_go/flutter/main.dart';
import 'package:custom_info_window/custom_info_window.dart';


class RGLocation extends StatefulWidget {
  static String routeName = '/location';
  @override
  RGLocationState createState() => new RGLocationState();
}

class RGLocationState extends State<RGLocation> {

  Location location = new Location();
  LocationData? _locationData;

  List<Marker> map_markers = [];

  GoogleMap? location_map;
  GoogleMapController? mapController;

  //custom info window
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {

    RandoGo.availableRando.forEach((r) {
      if (r.points.length != 0) {
        Marker new_marker = Marker(
          markerId: MarkerId("Rando_marker_" + r.name),
          position: LatLng(r.points[0].lat,r.points[0].long),
          icon: customIconRando,
          onTap: () {


            RandoGo.currentRando = r;
            Navigator.pushNamed(context,"/follow_rando/map",);
          },

        );
        map_markers.add(new_marker);
      }
    });

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
            ),
            CustomInfoWindow(
              controller: _customInfoWindowController,
              height: 75,
              width: 150,
              offset: 50,
            ),
        ]),
        drawer: RGDrawer(),
    );
  }

  //get the icons
  BitmapDescriptor customIconPos = BitmapDescriptor.defaultMarker;
  BitmapDescriptor customIconRando = BitmapDescriptor.defaultMarker;
  // make sure to initialize before map loading
  getIcons() async {
    //Position custom icon
    var iconPos = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(16,16)),
        "images/position.png");
    var iconRando = await BitmapDescriptor.fromAssetImage(
      //47*76
        ImageConfiguration(size: Size(23,38)),
        "images/hike 1.png");

    setState(() {
      this.customIconPos = iconPos;
      this.customIconRando = iconRando;
    });
  }

  @override
  void initState() {
    getIcons();
    super.initState();
  }
}

