import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = 'https://flutter.io';
const kAndroidUserAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';


final flutterWebViewPlugin = FlutterWebviewPlugin();

class WebViewExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://10.0.0.7:9004/news/detail/4fhf61mshw8eh',
      appBar: AppBar(
        title: Text('web view example'),
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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                flutterWebViewPlugin.goBack();
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){
                flutterWebViewPlugin.goForward();
              },
            ),
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: (){
                flutterWebViewPlugin.reload();
              },
            ),
          ],
        ),
      ),
    );
  }
}
