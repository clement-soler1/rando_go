import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
//import of model
import 'package:rando_go/flutter/model/user.dart';

class UserProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  List _users = [];

  UnmodifiableListView get users => UnmodifiableListView(_users);

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse('$host/api/users'));
      if (response.statusCode == 200) {
        _users = (json.decode(response.body) as List)
            .map((profileJson) => User.fromJson(profileJson))
            .toList();
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