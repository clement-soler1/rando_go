import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/all_layout.dart';
import 'package:rando_go/flutter/model/Point.dart';
import 'package:rando_go/flutter/provider/point_provider.dart';


class Create_Point extends StatefulWidget {
  static String routeName = '/create_point';

  static Point? pointToCreate;

  @override
  Create_PointState createState() => new Create_PointState();
}


class Create_PointState extends State<Create_Point>{

  Point p = Point(rando_id: -1, number: -1, lat: 0.0, long: 0.0, direction: "");

  static TextEditingController lat_controller = new TextEditingController();
  static TextEditingController long_controller = new TextEditingController();
  static TextEditingController desc_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    p = Create_Point.pointToCreate ?? Point(rando_id: -1, number: -1, lat: 0.0, long: 0.0, direction: "");

    lat_controller.text = p.getLat().toString();
    long_controller.text = p.getLong().toString();
    desc_controller.text = p.getDir();

    return Scaffold(
      appBar: RGAppBar(),
      backgroundColor: const Color(0xFF009143),
      body: Stack(
        children: [
          Center(
            child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  child :Text(RGCreateRando.randoInCreation?.getName() ?? "Nom de la randonnée",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
                ),
                Padding(
                  child :Text("Point N°" + p.getNumber().toString(),style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic),),
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Lat :",style: TextStyle(color: Colors.white),),
                        RGTextInput(label: "Lat", width: 100, obscureText: false,controller:  lat_controller,),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Long :",style: TextStyle(color: Colors.white)),
                        RGTextInput(label: "Long", width: 100, obscureText: false, controller: long_controller,),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: IconButton(
                    icon: Image.asset('images/balise.png'),
                    iconSize: 60,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:RGDescription(width: 500, label: 'Entrez la description',  height: 150,controller: desc_controller,),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  RGButton(label: "Suivant", width: 180, height: 50,onPressed: () => {
                    next()
                  },
                  ),
                  RGButton(label: "Fin", width: 180, height: 50,onPressed: () => {
                    end()
                  },),
                 ]
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: RGBottomBarCreation(isVisible: false,onClicked: () {Navigator.pop(context);},point_number: p.getNumber(),),
    );
  }

  void next() {
    createPoint();

    Navigator.pushNamed(context,"/mappoint");

  }

  void end() {
    createPoint();

    RGCreateRando.randoInCreation = null;
    Navigator.pushNamed(context,"/menu");
  }

  void createPoint() {

    p.setModif(lat_controller.text, long_controller.text, desc_controller.text);

    RGCreateRando.randoInCreation?.points.add(p);

    PointProvider provider = new PointProvider();
    provider.addPoint(p);

  }
}