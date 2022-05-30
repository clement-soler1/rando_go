import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RGBottomBar extends StatelessWidget with PreferredSizeWidget{

  @override
  final Size preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF247000),
      child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(Icons.directions_walk, color: Colors.white),
            Expanded(
              child: Text('7.0 Km', textAlign: TextAlign.left,style: const TextStyle(color: Colors.white,fontSize: 24)),
            ),
            Expanded(
              child: Text('00:00', textAlign: TextAlign.right,style: const TextStyle(color: Colors.white,fontSize: 24)),
            ),

    ],
      ),
    );
  }
}