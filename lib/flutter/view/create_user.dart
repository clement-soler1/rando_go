import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/widget/profile_widget.dart';

class CreateUser extends StatelessWidget {
  static String routeName = '/create_user';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF009143),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Creer un compte", style: TextStyle(color: Colors.white,fontSize: 35)),
                Padding(padding: EdgeInsets.all(30)),
                ProfileWidget(imagePath: 'images/profile.png', isEdit: true, onClicked: () {},),
                //Image(image: AssetImage('images/profile.png')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pseudo : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Pseudo", width: 200, obscureText: false,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mot de passe : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Mot de passe", width: 200, obscureText: true,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Email", width: 200, obscureText: false,),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                RGButton(label: "Creer mon compte", width: 350, height: 50)
              ],
            ),
          ),
        ],
      ),
    );
  }
}