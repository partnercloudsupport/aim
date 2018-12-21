import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      child: WebviewScaffold(
        url: 'https://www.baidu.com/',
        withZoom: true,
        withLocalStorage: true,
        hidden: true,
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text('detail'),
        ),
        initialChild: Center(child: CircularProgressIndicator(),),
      )
    );
  }
}