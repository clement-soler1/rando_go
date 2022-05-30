import 'dart:collection';
import 'package:rando_go/flutter/model/Point.dart';
import 'package:rando_go/flutter/provider/point_provider.dart';


class Rando {

  int id;
  String name;
  String creator;

  List<Point> points;

  Rando({
    required this.id,
    required this.name,
    required this.creator,
    required this.points
});

  Rando.fromJson(Map<String, dynamic> json):
        id = json['id'],
        name = json['name'],
        creator = json['creator'],
        points = [];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'creator': creator,
    };
  }

  void addPoint(Point p) {
    points.add(p);
  }

  void getPointFromBDD() {
    var provider = PointProvider();
    provider.fetchRandoPoints(this);
  }

}