import 'package:flutter/material.dart';

class RGRandoInfoWindow extends StatelessWidget {
  String title;
  String desc;
  final GestureTapCallback onPressed;

  RGRandoInfoWindow(
      {required this.title,
        required this.desc,
        required this.onPressed,
        }
      );

  @override
  Widget build(BuildContext context) {
    print("building");

    return Container(
      child: Column(
        children: [
          Text(this.title),
          Text(this.desc),
          Padding(padding: EdgeInsets.all(2), child :
            SizedBox(
              child :TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF424242)),
                  ),
                  onPressed: this.onPressed,
                  child: Text("LANCER",style: TextStyle(color: Colors.white, fontSize: 24,),)
              ),
              width: 50,
              height: 20,
            )
          )
        ],
      ),
    );
  }
}


