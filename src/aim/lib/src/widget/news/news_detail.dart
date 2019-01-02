import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../models.dart';
import '../../remotes.dart';


final flutterWebViewPlugin = FlutterWebviewPlugin();

class WebViewExamplePage extends StatelessWidget {
  final String code;
  WebViewExamplePage({Key key, @required this.code}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'http://10.0.0.7:9004/news/detail/'+code,
      appBar: AppBar(
        //title: Text('web view example'),
        //backgroundColor: Colors.grey,
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

class NewsDetailPage extends StatefulWidget {
  final ModelNewsItem item;
  NewsDetailPage({Key key, @required this.item}): super(key:key);

  @override
  State<StatefulWidget> createState() {
    return NewsDetailPageState();
  }
}

class NewsDetailPageState extends State<NewsDetailPage> {
  ModelNewsDetail _detail = null;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value) {
      RpcGetNewsDetail.request(data:{'code':widget.item.code}).then((detail) {
        setState(() {
          _detail = detail;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_detail == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
        appBar: AppBar(
          leading: FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
            ),
          ),
          title: Text('详情'),
        ),
        body: Builder(
          builder: (context) {
            return _NewsDetailContentWidget(detail: _detail);
          },
        )
    );
  }
}

class _NewsDetailContentWidget extends StatelessWidget{
  final ModelNewsDetail detail;
  _NewsDetailContentWidget({Key key, @required this.detail}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _NewsDetailTitleWidget(title: detail.title),
          _NewsDetailBriefWidget(brief: detail.brief),
          _NewsDetailBodyWidget(body: detail.body)
        ],
      ),
    );
  }
}

// news title
class _NewsDetailTitleWidget extends StatelessWidget {
  final String title;
  _NewsDetailTitleWidget({Key key, @required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        maxLines: 3,
        style: TextStyle(
          fontSize: 18.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.center,
    );
  }
}

// news brief
class _NewsDetailBriefWidget extends StatelessWidget {
  final String brief;
  _NewsDetailBriefWidget({Key key, @required this.brief}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        brief,
        //maxLines: 10,
        style: TextStyle(
          fontSize: 14.0,
        ),
        overflow: TextOverflow.fade,
      ),
      alignment: Alignment.center,
      color: Colors.grey,
    );
  }
}

// news body
class _NewsDetailBodyWidget extends StatelessWidget {
  final String body;
  _NewsDetailBodyWidget({Key key, @required this.body}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Html(
        data: body,
        padding: EdgeInsets.all(8.0),
        //backgroundColor: Colors.green,
        //renderNewlines: true,
        defaultTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16.0
        ),
        onLinkTap: (url) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(url)));
        },
        customRender: (node, children) {},
      ),
    );
  }
}