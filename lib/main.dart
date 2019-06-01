import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fludget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FludgetHomePage(),
    );
  }
}

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
