import 'package:flutter/material.dart';
import 'package:rando_go/flutter/all_layout.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rando_go/flutter/model/Point.dart';

class MapPoint extends StatefulWidget {
  static String routeName = '/mappoint';
  int? pointNumber;

  MapPoint({
   required pointNumber,
});

  @override
  MapPointState createState() => new MapPointState();
}

class MapPointState extends State<MapPoint>{

  GoogleMapController? mapController;
  List<Marker> map_markers = [];
  LatLng posClicked = LatLng(0.0, 0.0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    int pn = ((RGCreateRando.randoInCreation?.points.length ?? 0) + 1) ?? widget.pointNumber ?? 1;

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
      bottomNavigationBar: RGBottomBarCreation(onClicked: () {},point_number: pn,),
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 140,
            right: 0,
            child: FloatingActionButton(
              backgroundColor: Color(0xFF247000),
              onPressed: () {
                Point p = Point(
                    rando_id: RGCreateRando.availableID ?? 0,
                    number: pn,
                    lat: posClicked.latitude,
                    long: posClicked.longitude,
                    direction: "Entrez les consignes de direction"
                );
                Create_Point.pointToCreate = p;
                Navigator.push(context, MaterialPageRoute(builder: (context) => Create_Point()),
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
      posClicked = latLng;
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