import 'package:flutter/material.dart';

class RGButton extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  final GestureTapCallback onPressed;

  RGButton(
      {required this.label,
        required this.width,
        required this.height,
        required this.onPressed,
        }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10), child :
        SizedBox(
          child :TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF424242).withOpacity(0.70)),
              ),
              onPressed: this.onPressed,
              child: Text(this.label,style: TextStyle(color: Colors.white, fontSize: 24),)
          ),
          width: this.width,
          height: this.height,
      )
    );
  }
}

