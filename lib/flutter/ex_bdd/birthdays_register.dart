import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';

class BirthdaysRegister extends StatelessWidget {
  static String routeName = '/register';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0,100,0,0),
              child: SvgPicture.asset(
                "img/birthday/cupcake.svg",
                height: 50,
                width: 50,
                color: Colors.deepOrange ,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:10),
              child: const Text(
                "BirthDays",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 50
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: const Text(
                    "You will",
                    style: TextStyle(
                      fontFamily: "PatuaOne",
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 0, 2),
                  child: const Text(
                    "always",
                    style: TextStyle(
                      fontFamily: "PatuaOne",
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color:Colors.deepOrange,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
                  ),
                  width: 240,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 2, 5, 2),
                  child: const Text(
                    "remember",
                    style: TextStyle(
                      fontFamily: "PatuaOne",
                      color: Colors.white,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  decoration: const BoxDecoration(
                      color:Colors.deepOrange,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),)
                  ),
                  width: 240,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: const Text(
                    "the birthdays",
                    style: TextStyle(
                      fontFamily: "PatuaOne",
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: const Text(
                "of your loved ones !",
                style: TextStyle(
                  fontFamily: "PatuaOne",
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("You already have an account ?",style: TextStyle(
                    fontFamily: "PatuaOne",
                  ),),
                  TextButton(
                      onPressed: () => {},
                      child: const Text(
                        "LOG IN",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontFamily: "PatuaOne",
                        ),
                      ))
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,

              ),
              child: TextField(
                ),
              ),
          ],
        ),
      )
    );
  }
}