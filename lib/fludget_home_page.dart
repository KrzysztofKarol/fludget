import 'package:flutter/material.dart';

class FludgetHomePage extends StatefulWidget {
  FludgetHomePage({Key key}) : super(key: key);

  @override
  _FludgetHomePageState createState() => _FludgetHomePageState();
}

class _FludgetHomePageState extends State<FludgetHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              ListTile(title:Text("test"),),
              ListTile(title:Text("test"),),
              ListTile(title:Text("test"),),
              ListTile(title:Text("test"),),
            ],
          ),
        )
    );
  }
}
