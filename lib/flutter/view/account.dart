import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/widget/profile_widget.dart';
import 'package:rando_go/flutter/view/account_edit.dart';
import 'package:rando_go/flutter/utils/user_prefs.dart';

class Account extends StatelessWidget {
  static String routeName = '/account';
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
        backgroundColor: const Color(0xFF009143),
        appBar: RGAppBar(),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileWidget(imagePath: user.imagePath, onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Account_edit()),
                    );
                  },),
                  //Image(image: AssetImage('images/profile.png')),
                  Text(user.name,style: TextStyle(color: Colors.white,fontSize: 45),),
                  Padding(padding: EdgeInsets.all(20)),
                  Text("Membre depuis xx/xx/xxxx",style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Email : "+user.email,style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Nb de rando faite : xx",style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Nb de rando créer : xx",style: TextStyle(color: Colors.white,fontSize: 25),),
                ],
              ),
            ),
          ],
        ),
        drawer: RGDrawer(),
    );
  }
}