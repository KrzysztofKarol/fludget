import 'dart:math';
import 'package:flutter/material.dart';

class FludgetTile extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String title;
  var colors = [0xff03a9f4, 0xff4db6ac, 0xfff44336, 0xffe91e63, 0xff7c4dff];
  var random = Random();

  FludgetTile({this.name, this.imageUrl, this.title});

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
        child: Row(
          children: <Widget>[
            imageUrl != null
                ? Container(
                    child: Image(image: NetworkImage(imageUrl)),
                    width: 100.0,
                    height: 70.0,
                  )
                : Container(),
            Expanded(
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        name,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
