import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection'; // nouveaux types de listes comme UnmodifiableListView
import 'dart:convert'; // pour decoder la r ́eponse http
//import of model
import 'package:rando_go/flutter/model/Rando.dart';

class RandoProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  List _randos = [];

  UnmodifiableListView get randos => UnmodifiableListView(_randos);

  //recupération des randos
  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/randos'));
      if (response.statusCode == 200) {
        _randos = (json.decode(response.body) as List)
            .map((profileJson) => Rando.fromJson(profileJson))
            .toList();
        print("Randos loaded !");

        _randos.forEach( (r) => {
          r.getPointFromBDD()
        });

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Ajouter un user dans la base de donnees
  Future<void> addRando(Rando newRando) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$host/api/create_rando'),
        body: json.encode(newRando.toJson()),
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