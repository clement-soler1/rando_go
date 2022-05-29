import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test/birthday_app/flutter/Profile.dart';

class BirthdayCard extends StatelessWidget {
  final Profile profile;

  BirthdayCard(
      {required this.profile}
      );

  // On r ́ecup`ere une r ́ef ́erence de la fonction updatePressed
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            //name
            Container(
              child : Text(profile.getFullName(),style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              //color: Colors.deepOrange,
              margin: EdgeInsets.fromLTRB(50, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(75, 5, 0, 5),
              width: 200,
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            //image head
            CircleAvatar(
              backgroundImage: AssetImage(profile.getPhoto()),
              radius: 50,
            ),
            //logo age
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Stack(
                children: [
                  SvgPicture.asset(
                    "img/birthday/birthdayCake.svg",
                    height: 50,
                    width: 50,
                    color: Colors.deepOrange ,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                    child : Text(
                      profile.getNextAge().toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(255, 12, 0, 0),
              child: const Icon(
                Icons.mail,
                color: Colors.deepOrange,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(110, 50, 0, 0),
              child: Text(
                "Né(e) le "+profile.getFormatBirthDate(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(110, 65, 0, 0),
              child: Text(profile.getDaysLast(),style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),),
              ),
          ]
        ),
    );
  }
}