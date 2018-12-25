import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class NewsDetailPage extends StatelessWidget {
  final String title;
  final String url;

  NewsDetailPage({Key key, @required this.title, @required this.url}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Center(
         child: Text(
           title,
           overflow: TextOverflow.ellipsis,
         ),
        )
      )
    );
  }
}