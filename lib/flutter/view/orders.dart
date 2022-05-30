import 'package:flutter/material.dart';
import 'package:rando_go/flutter/cards/all_cards.dart';


class Orders extends StatelessWidget {
  static String routeName = '/Orders';
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
                      child:Text('Continuez de suivre les balises',
                        style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child:Text('Distance parcourue : 70m',
                        style: const TextStyle(color: Colors.white,fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child:Text('Distance restante : 6.8km',
                        style: const TextStyle(color: Colors.white,fontSize: 24),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child:Text('altitude : 420m',
                        style: const TextStyle(color: Colors.white,fontSize: 24),
                      ),
                    ),
                  ],
                  ),
                ),
          ],
        ),
        drawer: RGDrawer(),
      bottomNavigationBar: RGBottomBar(),


    );
  }
}