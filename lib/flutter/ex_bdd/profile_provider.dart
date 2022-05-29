import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection'; // nouveaux types de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la r ́eponse http
import 'package:test/birthday_app/flutter/Profile.dart';

class ProfileProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  // Variable priv ́ee pour qu'elle ne puisse pas ^etre modifi ́ee par
  // les widgets qui l'utilisent
  List _profiles = [
    Profile("Olivia", "Katam", "img/birthday/olivia.jpg", "0601020304", "1987-01-14"),
    Profile("David", "Meyer", "img/birthday/david.jpg", "0601020304", "1976-01-14"),
    Profile("Tom", "Mori", "img/birthday/tom.jpg", "0601020304", "2012-02-02"),
    Profile("Inès", "", "img/birthday/ines.jpg", "0601020304", "1995-03-21"),
    Profile("Marcus", "G.", "img/birthday/marcus.jpg", "0601020304", "1997-05-07"),
  ];

  // Getter pour l'acc`es en lecture
  // Pas de modificiation possible gr^ace au type UnmodifiableListView
  UnmodifiableListView get profiles => UnmodifiableListView(_profiles);

  // M ́ethode pour aller chercher des donn ́ees dans la base de donn ́ees
  // via le serveur en local
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/profiles'));
      if (response.statusCode == 200) {
        /*_profiles = (json.decode(response.body) as List)
            .map((profileJson) => Profile.fromJson(profileJson))
            .toList();*/
        _profiles = [];
        var tab = json.decode(response.body) as List;
        for (var obj in tab) {
          _profiles.add(Profile(obj['firstname'],obj['name'],obj['photo'],obj['phonenumber'],obj['birthdate']));
        }
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}