import 'package:flutter/material.dart';

class RGBottomBarCreation extends StatelessWidget with PreferredSizeWidget{
  final bool isVisible;
  final VoidCallback onClicked;
  final int point_number;

  RGBottomBarCreation({
    this.isVisible = true,
    required this.onClicked,
    required this.point_number,
  });

  @override
  final Size preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF247000),
      child: Row(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Icon(Icons.directions_walk, color: Colors.white),
          ),
          Expanded(
            child: Text('Point n°' + this.point_number.toString(), textAlign: TextAlign.left,style: const TextStyle(color: Colors.white,fontSize: 24)),
          ),
          Container(height: 55.0),
        ],
      ),
    );
  }
}