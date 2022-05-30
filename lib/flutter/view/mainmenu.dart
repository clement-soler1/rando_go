import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/provider/rando_provider.dart';


class MainMenu extends StatelessWidget {
  static String routeName = '/menu';

  @override
  Widget build(BuildContext context) {

    //recuperation des randos et points
    var rando_provider = RandoProvider();
    rando_provider.fetchData();

    return Scaffold(
        body: Stack(
          children: [
            Background(),
            Center(
                child :Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      child :Text("RandoGo",style: TextStyle(color: Colors.white,fontSize: 45),),
                      padding: EdgeInsets.only(bottom: 70),
                    ),
                    RGButton(label: "Navigation", width: 300, height: 100,onPressed: () => {},),
                    RGButton(label: "Créer une randonnée", width: 300, height: 100,onPressed: () => {
                      print(rando_provider.randos.first.points.length)
                    },),
                    RGButton(label: "Mon Compte", width: 300, height: 100,onPressed: () => {
                      Navigator.pushNamed(context,"/account")
                    },),
                    RGButton(label: "Quitter", width: 300, height: 100,onPressed: () => {},),
                  ],
                )

            ),
          ],
        )
    );
  }
}