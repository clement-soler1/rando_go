import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  static String routeName = '/account';
  @override
  Widget build(BuildContext context) {
    /*getAppBarTheme() {
      return const AppBarTheme().copyWith(backgroundColor: primaryColor);
    }*/
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("bkg.png"),
              fit: BoxFit.fitHeight,
              alignment: FractionalOffset.topCenter,
            ),
          ),
        )
    );
  }
}