import 'package:flutter/material.dart';
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
    DefaultAssetBundle.of(context).loadString('static/test1.html').then((value){
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
      body: SingleChildScrollView(
        child: Center(
          child: HtmlView(
            data: html,
            baseURL: "https://images.unsplash.com",
            onLaunchFail: (url){
              Scaffold.of(context).showSnackBar(SnackBar(content: url));
            },
          ),
        ),
      )
    );
  }
}