import 'package:flutter/material.dart';
import 'package:rando_go/all_layout.dart';

void main() {
  runApp(const RandoGo());
}

class RandoGo extends StatelessWidget {
  const RandoGo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RandoGo",
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0x009143FF),
        )
      ),
      home: Text("todo"),
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

