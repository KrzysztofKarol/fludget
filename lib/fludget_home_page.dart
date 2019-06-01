import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection('widgets').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();

              return ListTile(
                title: Text(snapshot.data.documents[0].data["name"]),
              );
            },
          ),
          ListTile(
            title: Text('Package of the day'),
          ),
          ListTile(
            title: Text('Github repo of the day'),
          ),
          ListTile(
            title: Text('Flutter app of the day'),
          ),
        ],
      ),
    ));
  }
}
