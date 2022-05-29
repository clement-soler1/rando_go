import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BirthdaysWelcome extends StatelessWidget {
  static String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
        children: [
          Image(image: AssetImage("img/birthday/BirthdayParty.jpg"),fit: BoxFit.cover,),
          Container(
            color: Color(0xB2FF5722),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: SvgPicture.asset(
                    "img/birthday/cupcake.svg",
                    height: 100,
                    width: 100,
                    color: Colors.white ,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "BirthDays",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Pacifico",
                      fontSize: 60
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}