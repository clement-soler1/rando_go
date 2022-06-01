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
  //const LocationState({Key? key}) : super(key: key);

  Location location = new Location();
  LocationData? _locationData;

  List<Marker> map_markers = [];//new Set<Marker>();
  /*Marker pos_marker = Marker(
    markerId: MarkerId("pos_marker"),
    position: LatLng(43.137365, 6.021006),
  );*/

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

  /*void initiateLocalisation() async {
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

      LatLng cur_pos = LatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);

      map_markers.remove(pos_marker);
      Marker new_pos_marker = Marker(
        markerId: MarkerId("pos_marker"),
        position: cur_pos,
        icon: customIconPos,
      );

      pos_marker = new_pos_marker;
      map_markers.add(pos_marker);


     /* mapController?.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: cur_pos ,zoom: 17.0),
          ),
      );*/

      //upDateMarkers(map_markers);
      //print("markers updated");

    });
  }*/

  @override
  Widget build(BuildContext context) {

    //definition des markers de la page
    //marker de position du joueur
    /*pos_marker = Marker(
      markerId: MarkerId("pos_marker"),
      position: LatLng(0, 0),
      icon: customIconPos,
    );*/
    //map_markers.add(pos_marker);

    //location_map = RGMap(markers: map_markers,);
    /*location_map = GoogleMap(
      mapType: MapType.terrain,
      initialCameraPosition: CameraPosition(target: LatLng(0.0, 0.0)),
      markers: Set<Marker>.from(map_markers),
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      compassEnabled: true,
    );*/

    //print(RandoGo.availableRando);
    RandoGo.availableRando.forEach((r) {
      Marker new_marker = Marker(
        markerId: MarkerId("Rando_marker_" + r.name),
        position: LatLng(r.points[0].lat,r.points[0].long),
        icon: customIconRando,
        onTap: () {
          /*_customInfoWindowController.addInfoWindow!(
            RGRandoInfoWindow(
                title: r.name,
                desc: "Rando crée par : " + r.creator,
                onPressed: () => {
                  print("yeah")
                }
            ),
              LatLng(r.points[0].lat,r.points[0].long)
          );*/

          //TO DO : lancer la rando
          RandoGo.currentRando = r;
          Navigator.pushNamed(context,"/follow_rando/map",);
        },
        /*infoWindow: InfoWindow(
          title: r.name,
          snippet: "Rando crée par : " + r.creator,


        )*/
      );

      map_markers.add(new_marker);
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
    //initiateLocalisation();
    super.initState();
  }
}

