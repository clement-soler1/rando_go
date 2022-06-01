import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rando_go/flutter/main.dart';
import 'package:rando_go/flutter/model/Rando.dart';
import 'package:rando_go/flutter/model/Point.dart';




class RGEndRando extends StatefulWidget {
  static String routeName = '/follow_rando/end';

  @override
  RGEndRandoState createState() => new RGEndRandoState();
}

class RGEndRandoState extends State<RGEndRando> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RGAppBar(),
      //appBar: ,
      body: Stack(
          children : [
            Background(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("images/rando.png"),width: 250, height: 250,),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Text("Vous avez terminer la randonée !", style: TextStyle(color: Colors.white,fontSize: 28),),
                  ),
                  RGButton(label: "Navigation", width: 300, height: 50, onPressed: () {
                    Navigator.pushNamed(context,"/location");
                  }),
                  RGButton(label: "Menu Principal", width: 300, height: 50, onPressed: () {
                    Navigator.pushNamed(context,"/menu");
                  }),
                ],
              ),
            )
          ]),
      drawer: RGDrawer(),
    );
  }
}