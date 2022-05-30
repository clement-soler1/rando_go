class Point {

  int rando_id;
  int number;
  String icon;
  double lat;
  double long;
  String direction;

  Point({
    required this.rando_id,
    required this.number,
    this.icon = "",
    required this.lat,
    required this.long,
    required this.direction
});

  Point.fromJson(Map<String, dynamic> json):
        rando_id = json['rando_id'],
        number = json['number'],
        icon = json['icon'],
        lat = json['lat'],
        long = json['long'],
        direction = json['direction'];

  Map<String, dynamic> toJson() {
    return {
      'rando_id': rando_id,
      'number': number,
      'icon': icon,
      'lat': lat,
      'long': long,
      'direction': direction,
    };
  }
}