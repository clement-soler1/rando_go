import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';


class MainMenu extends StatelessWidget {
  static String routeName = '/menu';
  @override
  Widget build(BuildContext context) {

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
                    RGButton(label: "Navigation", width: 300, height: 100),
                    RGButton(label: "Créer une randonnée", width: 300, height: 100),
                    RGButton(label: "Mon Compte", width: 300, height: 100),
                    RGButton(label: "Quitter", width: 300, height: 100),
                  ],
                )

            ),
          ],
        )
    );
  }
}