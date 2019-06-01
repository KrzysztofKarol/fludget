import 'package:flutter/material.dart';
import 'package:fludget/Fludget_tile.dart';

class FludgetHomePage extends StatefulWidget {
  FludgetHomePage({Key key}) : super(key: key);

  @override
  _FludgetHomePageState createState() => _FludgetHomePageState();
}

class _FludgetHomePageState extends State<FludgetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: FludgetTile()
//      Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          ListTile(
//            title: Text('Widget of the day'),
//          ),
//          ListTile(
//            title: Text('Package of the day'),
//          ),
//          ListTile(
//            title: Text('Github repo of the day'),
//          ),
//          ListTile(
//            title: Text('Flutter app of the day'),
//          ),
//        ],
//      ),
            ));
  }
}
