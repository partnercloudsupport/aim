import 'package:flutter/material.dart';

import 'src/stack.dart';
import 'src/push_to_refresh.dart';
import 'src/offstage.dart';
import 'src/indicator.dart';
import 'src/webview.dart';
import 'src/flutter_html_view.dart';
import 'src/flutter_html.dart';

void main() => runApp(MyExampleApp());


class MyExampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageWidget(),
    );
  }
}

class Example {
  final String name;
  final Widget widget;
  Example(this.name, this.widget);
}

class HomePageWidget extends StatelessWidget {
  List<Example> _examples = [
    Example('Stack', StackExamplePage()),
    Example('PullToRefresh', PushToRefreshExamplePage()),
    Example('OffStage', OffstageExamplePage()),
    Example('Indicator', IndicatorExamplePage()),
    Example('WebView', WebViewExamplePage()),
    Example('FlutterHtmlView', FlutterHtmlViewExamplePage()),
    Example('FlutterHtml', FlutterHtmlExamplePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Examples'),
      ),
      body: ListView.builder(
        itemCount: _examples.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_examples[index].widget));
            }, 
            child: Text(_examples[index].name),
            padding: EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}