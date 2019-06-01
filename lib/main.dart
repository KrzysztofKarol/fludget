import 'package:flutter/material.dart';

import 'fludget_home_page.dart';

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

