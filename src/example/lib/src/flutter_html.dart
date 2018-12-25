import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';

class FlutterHtmlExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlutterHtmlExamplePageState();
  }
}

class FlutterHtmlExamplePageState extends State<FlutterHtmlExamplePage> {
  String html = '<p>待加载</p>';

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString('static/test3.html').then((value){
      setState(() {
        html = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: ()=>Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text('stack example'),
        ),
        body: Builder(
          builder: (context){
            return SingleChildScrollView(
                child: Html(
                  data: html,
                  padding: EdgeInsets.all(8.0),
                  //backgroundColor: Colors.green,
                  //renderNewlines: true,
                  defaultTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                  ),
                  onLinkTap: (url){
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text(url)));
                  },
                  customRender: (node, children) {
                    if (node is dom.Element) {
                      switch (node.localName) {
                        case "custom_tag":
                          return Column(children: children);
                      }
                    }
                  },
                )
            );
          },
        )
    );
  }
}