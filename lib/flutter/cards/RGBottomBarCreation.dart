import 'package:flutter/material.dart';

class RGBottomBarCreation extends StatelessWidget with PreferredSizeWidget{
  final bool isVisible;
  final VoidCallback onClicked;

  RGBottomBarCreation({
    this.isVisible = true,
    required this.onClicked,
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
            child: Text('Point n°', textAlign: TextAlign.left,style: const TextStyle(color: Colors.white,fontSize: 24)),
          ),
          Visibility(
            child: Expanded(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  padding: new EdgeInsets.all(0.0),
                  icon: const Icon(
                    Icons.my_location, size: 25, color: Colors.black,
                  ),
                  onPressed: () {},
                  splashRadius: 22.0,
                ),
              ),
            ),
            visible: isVisible,
          ),
          Container(height: 55.0),
        ],
      ),
    );
  }
}