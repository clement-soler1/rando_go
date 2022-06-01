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
                Padding(padding: EdgeInsets.all(30)),
                UserForm()
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

class UserForm extends StatefulWidget {
  const UserForm({key});

  @override
  UserFormState createState() {
    return UserFormState();
  }
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 400.0,
            child: Row(
              children: [
                Text("Prénom : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                new Flexible(
                  child: new TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Prénom',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ est obligatoire';
                      }
                      return null;
                    },
                  ),
                )

              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 400.0,
            child: Row(
              children: [
                Text("Nom : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                new Flexible(
                  child: new TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Nom',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ est obligatoire';
                      }
                      return null;
                    },
                  ),
                )

              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 400.0,
            child: Row(
              children: [
                Text("Mot de passe : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                new Flexible(
                  child: new TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Mot de passe',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ est obligatoire';
                      }
                      return null;
                    },
                  ),
                )

              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          Container(
            width: 400.0,
            child: Row(
              children: [
                Text("Email : ",style: TextStyle(color: Colors.white,fontSize: 25),),
                new Flexible(
                  child: new TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ est obligatoire';
                      }
                      return null;
                    },
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.black,
                primary: Colors.white
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sauvegarde en cours')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}