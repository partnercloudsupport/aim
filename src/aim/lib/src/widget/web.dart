import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebPage extends StatelessWidget {
  final String title;
  final String url;
  WebPage({Key key, @required this.url, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url??'',
      appBar: AppBar(
        title: Text(this.title??''),
        leading: BackButton(),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
