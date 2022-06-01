import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/all_layout.dart';


class Unknow extends StatelessWidget {
  static String routeName = '/unknow';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: RGAppBar(),
      backgroundColor: const Color(0xFF009143),
        body: Stack(
          children: [
            Background(),
            Center(
                child :Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      child :Text("Wrong Way",style: TextStyle(color: Colors.white,fontSize: 45),),
                      padding: EdgeInsets.only(bottom: 70),
                    ),
                    RGButton(label: "Menu Principal", width: 300, height: 100,onPressed: () => {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainMenu()))
                    },),
                  ],
                ),
            ),
          ],
        ),
      drawer: RGDrawer(),
    );
  }
}