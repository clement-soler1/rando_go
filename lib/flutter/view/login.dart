import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';


class Login extends StatelessWidget {
  static String routeName = '/login';
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
                RGTextInput(label: "Login", width: 300, obscureText: false),
                RGTextInput(label: "Mot de passe", width: 300, obscureText: true),
                SizedBox(
                  child :TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF004B03)),
                    ),
                    onPressed: () => {},
                    child: Text("Se connecter",style: TextStyle(color: Colors.white, fontSize: 24,),)
                  ),
                  width: 300,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:TextButton(
                    onPressed: () => {},
                    child: Text("Vous n'avez pas de compte ? Créez en un",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )

          ),
        ],
      )
    );
  }
}