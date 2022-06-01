import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/widget/profile_widget.dart';

class Account_edit extends StatelessWidget {
  static String routeName = '/account_edit';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF009143),
      appBar: RGAppBar(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileWidget(imagePath: 'images/profile.png', isEdit: true, onClicked: () async {},),
                RGTextInput(label:"Profile name", width: 300, obscureText: false,),
                Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Email", width: 200, obscureText: false,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.save, color: Colors.black),
      ),
    );
  }
}