import 'package:flutter/material.dart';
import 'package:test/birthday_app/flutter/birthday_card.dart';
import 'package:test/birthday_app/flutter/Profile.dart';
import 'package:test/birthday_app/flutter/profile_provider.dart';

class NextBirthdays extends StatelessWidget {
  static String routeName = '/nextBirthdays';
  @override
  Widget build(BuildContext context) {

    //profile list
    /*List profiles = [
      Profile("Olivia", "Katam", "img/birthday/olivia.jpg", "0601020304", "1987-01-14"),
      Profile("David", "Meyer", "img/birthday/david.jpg", "0601020304", "1976-01-14"),
      Profile("Tom", "Mori", "img/birthday/tom.jpg", "0601020304", "2012-02-02"),
      Profile("Inès", "", "img/birthday/ines.jpg", "0601020304", "1995-03-21"),
      Profile("Marcus", "G.", "img/birthday/marcus.jpg", "0601020304", "1997-05-07"),
    ];*/
    var provider = ProfileProvider();
    provider.fetchData();

    List profiles = provider.profiles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Birthdays List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(onPressed: () => {}, icon: Icon(Icons.more_vert),color: Colors.white,)
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: BirthdayCard(profile: profiles[i]),
              );
            },
            itemCount: profiles.length)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}