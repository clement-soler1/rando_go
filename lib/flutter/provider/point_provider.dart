import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection'; // nouveaux types de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la r ́eponse http
//import of model
import 'package:rando_go/flutter/model/Point.dart';
import 'package:rando_go/flutter/model/Rando.dart';

class PointProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  // Variable priv ́ee pour qu'elle ne puisse pas ^etre modifi ́ee par
  // les widgets qui l'utilisent
  List _points = [];

  // Getter pour l'acc`es en lecture
  // Pas de modificiation possible gr^ace au type UnmodifiableListView
  UnmodifiableListView get points => UnmodifiableListView(_points);

  //getAllPoints
 /* void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/users'));
      if (response.statusCode == 200) {
        _points = (json.decode(response.body) as List)
            .map((profileJson) => Point.fromJson(profileJson))
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
  }*/

  // Add points
  Future<void> addPoint(Point newPoint) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/create_point'),
        body: json.encode(newPoint.toJson()),
        headers: {'Content-type': 'application/json'},
      );
      if (response.statusCode == 200) {
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  //get point of a rando
  void fetchRandoPoints(Rando rando) async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/getRandoPoints'));
      if (response.statusCode == 200) {
        List all_points = (json.decode(response.body) as List)
            .map((json) => Point.fromJson(json))
            .toList();

        _points = [];
        _points.addAll(all_points);
        _points.retainWhere((point) => point.rando_id == rando.id);

        _points.forEach( (p) => {
          rando.addPoint(p)
        });

        print("Rando points loaded !");

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}