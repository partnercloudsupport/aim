//import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class FlutterHtmlViewExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FlutterHtmlViewExamplePageState();
  }
}

class FlutterHtmlViewExamplePageState extends State<FlutterHtmlViewExamplePage> {
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          onPressed: ()=>Navigator.pop(context),
          child: Icon(
            CupertinoIcons.back,
          ),
        ),
        middle: Text('stack example'),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: HtmlView(
            data: html,
            baseURL: "https://images.unsplash.com",
            onLaunchFail: (url){
              //Scaffold.of(context).showSnackBar(SnackBar(content: url));
            },
          ),
        ),
      )
    );
  }
}