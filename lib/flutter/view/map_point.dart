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

  GoogleMapController? mapController;
  List<Marker> map_markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RGAppBar(),
      //appBar: ,
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: CameraPosition(target: LatLng(43.1380, 6.0132),zoom: 9.0,),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        zoomControlsEnabled: false,
        markers: Set.from(map_markers),
        onTap: _handleTap,
        /*  map_markers.add(Marker(markerId: MarkerId('mark'), position: latLng));
          this.markers: Set.from(map_markers);
          markers: Set.from(map_markers),*/
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
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => Create_Point()),
              );},
              child: const Icon(
                Icons.add_location_alt,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _handleTap(LatLng latLng) {
    setState(() {
      map_markers = []; // Mettre en comentaire si on veut plusieur markers
      map_markers.add(
        Marker(
            markerId: MarkerId(latLng.toString()),
            position: latLng,
        )
      );
    });
  }
}