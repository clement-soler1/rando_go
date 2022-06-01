import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/main.dart';
import 'package:rando_go/flutter/widget/profile_widget.dart';
import 'package:rando_go/flutter/view/account_edit.dart';
import 'package:rando_go/flutter/utils/user_prefs.dart';

class Account extends StatelessWidget {
  static String routeName = '/account';
  @override
  Widget build(BuildContext context) {
    //final user = UserPreferences.myUser; -> to the dechetterie

    //handle profile img :
    String? p_image = RandoGo.currentUser!.imagePath;
    if (p_image == null || p_image == "") {
      p_image = "images/profile.png";
    }

    String name = RandoGo.currentUser!.firstname + " " + RandoGo.currentUser!.name;

    int nbRandoCreated = 0;
    List randoCreated = [];
    randoCreated.addAll(RandoGo.availableRando);
    print(RandoGo.availableRando.length);
    randoCreated.retainWhere((r) => r.creator == RandoGo.currentUser!.email);
    nbRandoCreated = randoCreated.length;

    return Scaffold(
        backgroundColor: const Color(0xFF009143),
        appBar: RGAppBar(),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileWidget(imagePath: p_image, onClicked: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Account_edit()),
                    );
                  },),
                  //Image(image: AssetImage('images/profile.png')),
                  Text(name,style: TextStyle(color: Colors.white,fontSize: 35),),
                  Padding(padding: EdgeInsets.all(20)),
                  Text("Membre depuis xx/xx/xxxx",style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Email : "+RandoGo.currentUser!.email,style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Nb de rando faite : xx",style: TextStyle(color: Colors.white,fontSize: 25),),
                  Padding(padding: EdgeInsets.all(10)),
                  Text("Nb de rando créer : " + nbRandoCreated.toString(),style: TextStyle(color: Colors.white,fontSize: 25),),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: RGButton(label: "Retour", width: 100,height: 50, onPressed: () => {
                  Navigator.pushNamed(context,"/menu")
                })
            )
          ],
        ),
        drawer: RGDrawer(),
    );
  }
}