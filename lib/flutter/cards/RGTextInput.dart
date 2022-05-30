import 'package:flutter/material.dart';

class RGTextInput extends StatelessWidget {
  final String label;
  final double width;
  final bool obscureText;

  TextEditingController? controller;

  RGTextInput(
      {required this.label,
        required this.width,
        required this.obscureText,
        this.controller
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container (
      child: TextField(
        controller: this.controller,
        obscureText: this.obscureText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          labelText: this.label,
        ),
      ),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0),),
      margin: EdgeInsets.fromLTRB(10,20,10,20),
      width: this.width,
    );
  }
}

