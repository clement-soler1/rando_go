import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';
import 'package:rando_go/flutter/provider/user_provider.dart';
import 'package:rando_go/flutter/utils/Security.dart';
import 'package:rando_go/flutter/model/user.dart';
import 'package:rando_go/flutter/main.dart';


class Login extends StatelessWidget {
  static String routeName = '/login';

  static TextEditingController username_controller = new TextEditingController();
  static TextEditingController password_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    //try querying users from db
    var provider = UserProvider();
    provider.fetchData();

    //List users = provider.users;

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
                RGTextInput(label: "Login", width: 300, obscureText: false,controller: username_controller,),
                RGTextInput(label: "Mot de passe", width: 300, obscureText: true,controller: password_controller,),
                SizedBox(
                  child :TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF004B03)),
                    ),
                    onPressed: () => {
                      connect(username_controller.text, password_controller.text, provider.users,context)
                    },
                    child: Text("Se connecter",style: TextStyle(color: Colors.white, fontSize: 24,),)
                  ),
                  width: 300,
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child:TextButton(
                    onPressed: () => {
                    Navigator.pushNamed(context,"/create_user")
                    },
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

  void connect(username,password,userlist,context) {
    String cryptedPwd = Security.encrypt(password);

    User? usr = userlist.firstWhere((user) => user.email==username && user.password==cryptedPwd, orElse: () => null);

    if (usr != null) {
      RandoGo.currentUser = usr;
      print("connected");

      Navigator.pushNamed(context,"/app");

    } else {
      print("Bad credentials !");
    }

  }
}