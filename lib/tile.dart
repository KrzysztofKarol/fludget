import 'dart:math';
import 'package:flutter/material.dart';

class FludgetTile extends StatefulWidget {
  @override
  _FludgetTileState createState() => _FludgetTileState();
}

class _FludgetTileState extends State<FludgetTile> {
  String _imageUrl;
  void initState() {
    super.initState();
  }

  Future getImage() async {
    setState(() {
      _imageUrl = "";
    });
  }

  var colors = [0xff03a9f4, 0xff4db6ac, 0xfff44336, 0xffe91e63, 0xff7c4dff];
  var random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(

//        height: 100.0,
        child: Card(
          color: Color(colors[random.nextInt(colors.length - 1)]),
          elevation: 8.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Container(
            height: 150,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Widget of the Day",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          color: Colors.white,
                          width: 100.0,
                          height: 70.0,
                        ),
                        flex: 4,
                      ),
                      Flexible(
                        flex: 4,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Align",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
