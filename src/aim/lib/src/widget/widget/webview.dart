import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class WebViewPage extends StatelessWidget {
  final Widget title;
  final String url;
  WebViewPage({Key key, @required this.url, this.title}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.url,
      appBar: AppBar(
        title: this.title,
        leading: FlatButton(
          onPressed: ()=>Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
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
