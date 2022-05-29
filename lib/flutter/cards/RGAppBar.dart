import 'package:flutter/material.dart';

class RGAppBar extends StatelessWidget with PreferredSizeWidget{

  @override
  final Size preferredSize = Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("RandoGo"),
      centerTitle: true,
      backgroundColor: Color(0xFF247000),
      foregroundColor: Colors.white,
    );
  }
}