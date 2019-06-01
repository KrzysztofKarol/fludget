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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Expanded(
            child: ListView(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Card(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: Firestore.instance.collection('widgets').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) return LinearProgressIndicator();

                        return ListTile(
                          title: Text(snapshot.data.documents[0].data["name"]),
                          leading: FlutterLogo(),
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
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Card(
                    child: ListTile(
                      title: Text('Package of the day'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Card(
                    child: ListTile(
                      title: Text('Github repo of the day'),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Card(
                    child: ListTile(
                      title: Text('Flutter app of the day'),
                    ),
                  ),
                ),
              ],
            ),
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
