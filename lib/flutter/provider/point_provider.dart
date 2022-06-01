import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
//import of model
import 'package:rando_go/flutter/model/Point.dart';
import 'package:rando_go/flutter/model/Rando.dart';

class PointProvider with ChangeNotifier {
  final String host = 'http://localhost:80';

  List _points = [];

  UnmodifiableListView get points => UnmodifiableListView(_points);

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

        notifyListeners();
      }
    } catch (e) {
      rethrow;
    }
  }
}