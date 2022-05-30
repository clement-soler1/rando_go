import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/model/user.dart';
import 'package:rando_go/flutter/provider/user_provider.dart';
import 'package:rando_go/flutter/utils/Security.dart';

class UserCreated extends StatelessWidget {
  static String routeName = '/user_created';

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
                Icon(Icons.verified_outlined,color: Colors.white,size: 200,),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: Text("Utilisateur créé ! ",style: TextStyle(color: Colors.white,fontSize: 25),),
                ),
                RGButton(label: "Se connecter", width: 200, height: 50, onPressed: () => {
                  Navigator.pushNamed(context,"/app")
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}