import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rando_go/flutter/all_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rando_go/flutter/model/user.dart';
import 'package:rando_go/flutter/model/Rando.dart';

void main() {
  runApp(RandoGo());
}

class RandoGo extends StatelessWidget {
  RandoGo({Key? key}) : super(key: key);

  static User? currentUser = null;
  static List<Rando> availableRando = [];
  static Rando? currentRando;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "RandoGo",
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(),
          primaryColor: const Color(0xFF009143),
      ),
      //home: Login(),
      initialRoute: "/app",
      routes: {
        Login.routeName : (context) => Login(),
        MainMenu.routeName : (context) => MainMenu(),
        CreateUser.routeName : (context) => CreateUser(),
        UserCreated.routeName : (context) => UserCreated(),
        Account.routeName : (context) => Account(),
        Orders.routeName : (context) => Orders(),
        MapPoint.routeName : (context) => MapPoint(),
        RGLocation.routeName : (context) => RGLocation(),
        RGFollowRandoMap.routeName : (context) => RGFollowRandoMap(randoFollowed: currentRando ?? Rando(id: -1, name: "name", creator: "creator", points: [])),
        Create_Point.routeName : (context) => Create_Point(),
        RGEndRando.routeName : (context) => RGEndRando(),
        RGCreateRando.routeName : (context) => RGCreateRando(),
      },
      onGenerateRoute: (settings) {

        if (settings.name == "/app") {
          //final Data arguments = settings.arguments as Data;
          if (RandoGo.currentUser != null) {
            return MaterialPageRoute(builder: (context) {
              return MainMenu();
            });
          } else {
            return MaterialPageRoute(builder: (context) {
              return Login();
            });
          }
        }
      },
      onUnknownRoute: (settings) {
        //return MaterialPageRoute(builder: (context) => NotFound());
        return MaterialPageRoute(builder: (context) => MainMenu());
      },
    );
  }
}

