import 'package:fludget/tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetOfTheDayPage(
                                url: snapshot.data.documents[0].data["url"],
                                widgetName:
                                    snapshot.data.documents[0].data["name"],
                              )));
                },
              );
            },
          ),
          FludgetTile(),
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

class WidgetOfTheDayPage extends StatelessWidget {
  final String url;
  final String widgetName;
  const WidgetOfTheDayPage({
    this.url,
    this.widgetName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget of the day: $widgetName'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: WebView(
        key: UniqueKey(),
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: url,
      ),
    );
  }
}
