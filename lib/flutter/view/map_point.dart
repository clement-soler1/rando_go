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

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {

    List<Marker> map_markers = [];

    return Scaffold(
      appBar: RGAppBar(),
      //appBar: ,
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
        markers: Set<Marker>.from(map_markers),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        zoomControlsEnabled: false,
      ),
      drawer: RGDrawer(),
      bottomNavigationBar: RGBottomBarCreation(onClicked: () {}),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 140,
            right: 0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF247000),
              onPressed: () {/* Do something */},
              child: const Icon(
                Icons.touch_app,
                size: 40,
              ),
            ),
          ),
          Positioned(
            top: 210,
            right: 0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF247000),
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Create_Point()),
              );},
              child: const Icon(
                Icons.add_location_alt,
                size: 40,
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
  }
}