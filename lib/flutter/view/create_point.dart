import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';


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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset('images/balise.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:RGDescription(width: 500, label: 'Entrez la description',  height: 250,
                  ),
                ),
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