import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/provider/rando_provider.dart';
import 'package:rando_go/flutter/model/Rando.dart';
import 'package:rando_go/flutter/main.dart';


class RGCreateRando extends StatefulWidget {
  static String routeName = '/rando/create';

  static int? availableID;

  @override
  RGCreateRandoState createState() => new RGCreateRandoState();
}

class RGCreateRandoState extends State<RGCreateRando> {

  static TextEditingController nom_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    RandoProvider provider = new RandoProvider();
    provider.getAvailableId();

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
                    child: Text("Créer votre randonnée !", style: TextStyle(color: Colors.white,fontSize: 28),),
                  ),
                  RGTextInput(label: "Nom de la randonnée", width: 300, obscureText: false,controller: nom_controller,),
                  RGButton(label: "Créer", width: 300, height: 50, onPressed: () {
                    createRando();
                  }),
                ],
              ),
            )
          ]),
      drawer: RGDrawer(),
    );
  }

  void createRando() {
      Rando r = Rando(id: RGCreateRando.availableID ?? -1,name: nom_controller.text,creator: RandoGo.currentUser!.getEmail(),points: []);

      RandoProvider provider = new RandoProvider();
      provider.addRando(r);

      //go to creation de point
  }
}