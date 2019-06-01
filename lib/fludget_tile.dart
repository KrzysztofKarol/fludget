import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FludgetTile extends StatelessWidget {
  final String name;
  final String imgUrl;
  final String description;

  FludgetTile({
    this.name,
    this.imgUrl,
    this.description,
  });

  final colors = [0xff03a9f4, 0xff4db6ac, 0xfff44336, 0xffe91e63, 0xff7c4dff];
  final random = Random();

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
                          name,
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
