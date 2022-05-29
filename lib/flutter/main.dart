import 'package:flutter/material.dart';
import 'package:rando_go/flutter/all_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rando_go/flutter/model/user.dart';

void main() {
  runApp(RandoGo());
}

class RandoGo extends StatelessWidget {
  RandoGo({Key? key}) : super(key: key);

  User? currentUser = null;

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
      home: Login(),
      /*initialRoute: MaPremiereRoute.routeName,
      routes: {
        MaPremiereRoute.routeName : (context) => MaPremiereRoute(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == MaSecondeRoute.routeName) {
          final Data arguments = settings.arguments as Data;
          return MaterialPageRoute(builder: (context) {
            return MaSecondeRoute(
              title: arguments.title,
              content: arguments.content,
            );
          },
          );
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => NotFound());
      },*/
    );
  }
}

