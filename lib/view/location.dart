import 'package:flutter/material.dart';
import 'package:rando_go/cards/all_cards.dart';

class Location extends StatefulWidget {
  @override
  LocationState createState() => new LocationState();
}

class LocationState extends State<Location> {
  //const LocationState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RGAppBar(),
        //appBar: ,
        body: RGMap(),
        drawer: RGDrawer(),
    );
  }
}

