import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection'; // nouveaux types de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la r ́eponse http
//import of model
import 'package:rando_go/flutter/model/user.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  // Variable priv ́ee pour qu'elle ne puisse pas ^etre modifi ́ee par
  // les widgets qui l'utilisent
  List _users = [];

  // Getter pour l'acc`es en lecture
  // Pas de modificiation possible gr^ace au type UnmodifiableListView
  UnmodifiableListView get users => UnmodifiableListView(_users);

  // M ́ethode pour aller chercher des donn ́ees dans la base de donn ́ees
  // via le serveur en local
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/users'));
      if (response.statusCode == 200) {
        _users = (json.decode(response.body) as List)
            .map((profileJson) => User.fromJson(profileJson))
            .toList();
        /*_users = [];
        var tab = json.decode(response.body) as List;
        for (var obj in tab) {
          //_users.add(Profile(obj['firstname'],obj['name'],obj['photo'],obj['phonenumber'],obj['birthdate']));
          _users.add(User(imagePath: obj["imagePath"], name: obj["name"], email: obj["email"],firstname: obj["firstname"],password: obj["password"],phonenumber: obj["phonenumber"]));
        }*/
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Ajouter un user dans la base de donnees
  Future<void> addUser(User newUser) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/create_user'),
        body: json.encode(newUser.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}