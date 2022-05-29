import 'package:flutter/material.dart';
import 'package:rando_go/flutter/all_layout.dart';

class RGDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF009143),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Text('RandoGo', style: TextStyle(color: Colors.white,fontSize: 26),),
            color: Color(0xFF009143),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(0),
          ),
          Divider(color: Colors.white,),
          ListTile(
            title: const Text('Menu Principal', style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.home),
            iconColor: Colors.white,
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => MainMenu()));
            },
          ),
          ListTile(
            title: const Text('Mon Compte', style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.account_circle),
            iconColor: Colors.white,
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => Account()));
            },
          ),
          ListTile(
            title: const Text('Navigation', style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.directions_walk),
            iconColor: Colors.white,
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => RGLocation()));
            },
          ),
          ListTile(
            title: const Text('Créer', style: TextStyle(color: Colors.white),),
            leading: Icon(Icons.add_circle),
            iconColor: Colors.white,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}