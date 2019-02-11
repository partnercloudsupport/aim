import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

String selectedUrl = 'https://flutter.io';
const kAndroidUserAgent = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';


class WebViewExamplePage extends StatefulWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  @override
  State<StatefulWidget> createState() {
    return WebViewExamplePageState();
  }
}

class WebViewExamplePageState extends State<WebViewExamplePage> {
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    widget.flutterWebViewPlugin.close();
    widget.flutterWebViewPlugin.hide();
    Future.delayed(Duration(seconds: 2)).then((val){
      //String code1 = 'document.getElementsByClassName(\'comm-nav\')[0].remove()';
      //String code2 = 'document.getElementsByClassName(\'stock-footer\')[0].remove()';
      String code3 = 'document.getElementsByClassName(\'hexm-top\')[0].remove()';
      //widget.flutterWebViewPlugin.evalJavascript(code1);
      //widget.flutterWebViewPlugin.evalJavascript(code2);
      widget.flutterWebViewPlugin.evalJavascript(code3);
      widget.flutterWebViewPlugin.show();
    });

    _onStateChanged = widget.flutterWebViewPlugin.onStateChanged.listen((state){
      print('state changed: ${state.type}, ${state.url}');
      if(state.type == WebViewState.startLoad) {
        widget.flutterWebViewPlugin.hide();
      }

      if(state.type == WebViewState.finishLoad){
        String code1 = 'document.getElementsByClassName(\'comm-nav\')[0].remove()';
        String code2 = 'document.getElementsByClassName(\'stock-footer\')[0].remove()';
        String code3 = 'document.getElementsByClassName(\'hexm-top\')[0].remove()';
        widget.flutterWebViewPlugin.evalJavascript(code1);
        widget.flutterWebViewPlugin.evalJavascript(code2);
        widget.flutterWebViewPlugin.evalJavascript(code3);

        widget.flutterWebViewPlugin.show();
      }
    });

    _onUrlChanged = widget.flutterWebViewPlugin.onUrlChanged.listen((url){
      print('url changed: $url');
    });

    _onHttpError = widget.flutterWebViewPlugin.onHttpError.listen((error){
      print('http error: ${error.code}, ${error.url}');
    });
  }

  @override
  void dispose() {
    _onStateChanged.cancel();
    widget.flutterWebViewPlugin.close();
    widget.flutterWebViewPlugin.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://m.10jqka.com.cn/stockpage/hs_000725/', //'https://emwap.eastmoney.com/quota/stock/index/0007252',//'http://10.0.0.7:9004/news/detail/4fhf61mshw8eh',
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
      clearCache: true,
      appCacheEnabled: false,
      hidden: true,
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                widget.flutterWebViewPlugin.goBack();
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: (){
                widget.flutterWebViewPlugin.goForward();
              },
            ),
            IconButton(
              icon: Icon(Icons.autorenew),
              onPressed: (){
                //flutterWebViewPlugin.reload();
                String code = 'document.getElementsByClassName(\'comm-nav\')[0].remove()';
                widget.flutterWebViewPlugin.evalJavascript(code);
              },
            ),
          ],
        ),
      ),
    );
  }
}
