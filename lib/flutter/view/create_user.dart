import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/model/user.dart';
import 'package:rando_go/flutter/widget/profile_widget.dart';
import 'package:rando_go/flutter/provider/user_provider.dart';
import 'package:rando_go/flutter/utils/Security.dart';

class CreateUser extends StatelessWidget {
  static String routeName = '/create_user';

  static TextEditingController prenom_controller = new TextEditingController();
  static TextEditingController nom_controller = new TextEditingController();
  static TextEditingController email_controller = new TextEditingController();
  static TextEditingController pwd_controller = new TextEditingController();

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
                    Text("Prénom : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Prénom", width: 200, obscureText: false, controller: prenom_controller,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nom : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Nom", width: 200, obscureText: false,controller: nom_controller,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mot de passe : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Mot de passe", width: 200, obscureText: true, controller: pwd_controller,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Email : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                    RGTextInput(label:"Email", width: 200, obscureText: false,controller: email_controller,),
                  ],
                ),
                Padding(padding: EdgeInsets.all(10)),
                RGButton(label: "Creer mon compte", width: 350, height: 50,onPressed: () => {
                  handleUserCreation(context,prenom_controller.text, nom_controller.text, pwd_controller.text, email_controller.text)
                },)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleUserCreation(context,fname,name,pwd,email) async {

    String crypted = Security.encrypt(pwd);

    User newUser = User(imagePath: "", name: name, email: email,password: crypted,firstname: fname,phonenumber: "");

    var provider = UserProvider();
    provider.addUser(newUser);

    print("user added !");

    Navigator.pushNamed(context,"/user_created");
  }
}