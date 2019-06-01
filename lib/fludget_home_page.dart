import 'package:fludget/tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Application_of_day_tile.dart';

class FludgetHomePage extends StatefulWidget {
  FludgetHomePage({Key key}) : super(key: key);

  @override
  _FludgetHomePageState createState() => _FludgetHomePageState();
}

class _FludgetHomePageState extends State<FludgetHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('widgets').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return LinearProgressIndicator();

                    return InkWell(
                      child: FludgetTile(
                          name: snapshot.data.documents[0].data["name"],
                          imageUrl:
                              snapshot.data.documents[0].data["image_url"],
                          title: "Widget of the Day"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetOfTheDayPage(
                                      url: snapshot
                                          .data.documents[0].data["url"],
                                      widgetName: snapshot
                                          .data.documents[0].data["name"],
                                      prefix: "Widget",
                                    )));
                      },
                    );
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('repos').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return LinearProgressIndicator();

                    return InkWell(
                      child: FludgetTile(
                          name: snapshot.data.documents[0].data["name"],
                          title: "Repo of the Day"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetOfTheDayPage(
                                      url: snapshot
                                          .data.documents[0].data["url"],
                                      widgetName: snapshot
                                          .data.documents[0].data["name"],
                                      prefix: "Repo",
                                    )));
                      },
                    );
                  },
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection('packages').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return LinearProgressIndicator();

                    return InkWell(
                      child: FludgetTile(
                          name: snapshot.data.documents[0].data["name"],
                          title: "Package of the Day"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WidgetOfTheDayPage(
                                      url: snapshot
                                          .data.documents[0].data["url"],
                                      widgetName: snapshot
                                          .data.documents[0].data["name"],
                                      prefix: "Package",
                                    )));
                      },
                    );
                  },
                ),
//              ListTile(
//                title: Text('Flutter app of the day'),
//              ),
                ApplicationOfTheDay()
              ],
            ),
          ),
        ));
  }
}

class WidgetOfTheDayPage extends StatelessWidget {
  final String url;
  final String widgetName;
  final String prefix;

  const WidgetOfTheDayPage({this.url, this.widgetName, this.prefix});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$prefix of the day: $widgetName'),
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
