import 'package:flutter/material.dart';
import 'widget/webview.dart';
import 'container/news.dart';
import '../routes.dart';
import '../model/news.dart';


class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsContainer(
        onTap: (item) {
          AppNav.push(context, NewsDetailPage(item: item));
        },
      )
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final ModelNewsItem item;
  NewsDetailPage({Key key, @required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.item?.title??'--'),
        leading: BackButton(),
      ),
      body: WebView(
        url: this.item?.url,
      ),
    );;
  }
}