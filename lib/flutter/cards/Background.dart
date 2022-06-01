import 'package:flutter/material.dart';

class Background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bkg.png"),
            fit: BoxFit.cover),
      ),
    );
  }
}


