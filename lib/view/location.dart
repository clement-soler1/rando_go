import 'package:flutter/material.dart';
import 'package:rando_go/cards/all_cards.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: RGAppBar(),
        body: RGMap(),
    );
  }
}

