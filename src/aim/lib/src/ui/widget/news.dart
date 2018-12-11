import 'package:flutter/material.dart';


import '../../models.dart';


class NewsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsWidgetState();
  }
}


class _NewsWidgetState extends State<NewsWidget> {
  // news channels
  List<NewsChannel> _channels;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('资讯'),
      ),
      body: Center(
        child: Text('news'),
      ),
    );
  }
}