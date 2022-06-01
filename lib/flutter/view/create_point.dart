import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/all_layout.dart';


class Create_Point extends StatelessWidget {
  static String routeName = '/create_point';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RGAppBar(),
      backgroundColor: const Color(0xFF009143),
      body: Stack(
        children: [
          Center(
            child :Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  child :Text("Nom de randonnée",style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),),
                  padding: EdgeInsets.only(bottom: 70),
                ),
                const Padding(
                  child :Text("Point N°7",style: TextStyle(color: Colors.white,fontSize: 45,fontStyle: FontStyle.italic),),
                  padding: EdgeInsets.only(bottom: 70),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: IconButton(
                    icon: Image.asset('images/balise.png'),
                    iconSize: 130,
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:RGDescription(width: 500, label: 'Entrez la description',  height: 250,
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  RGButton(label: "Suivant", width: 180, height: 50,onPressed: () => {},
                  ),
                  RGButton(label: "Fin", width: 180, height: 50,onPressed: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MainMenu()))
                  },),
                 ]
                )
              ],
            ),
          ),
        ],
      ),
      drawer: RGDrawer(),
      bottomNavigationBar: RGBottomBarCreation(isCreating: true,onClicked: () {}),
    );
  }
}