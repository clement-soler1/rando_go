import 'package:flutter/material.dart';

  class RGDescription extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  TextEditingController? controller;


  RGDescription(
      {required this.label,
        required this.width,
        required this.height,
        this.controller
      }
      );

  @override
  Widget build(BuildContext context) {
    return Container (
      child: TextField(
        controller: this.controller,
        keyboardType: TextInputType.multiline,
        style: TextStyle(
          color: Colors.white,
        ),
        maxLines: 12,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(  borderSide: const BorderSide(color: Colors.white, width: 0.0),),
          disabledBorder: OutlineInputBorder(  borderSide: const BorderSide(color: Colors.white, width: 0.0),),
          focusedBorder: OutlineInputBorder(  borderSide: const BorderSide(color: Colors.white, width: 0.0),),
          labelText: this.label,
          filled: true,
          fillColor: Color(0xFF009143),

        ),
      ),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(5.0),),
      margin: EdgeInsets.fromLTRB(10,20,10,20),
      width: this.width,
      height: this.height,
    );
  }
}

