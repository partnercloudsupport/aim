import 'package:flutter/material.dart';

import '../../models.dart' as models;


class NewsListWidget extends StatefulWidget {
  // news category widget for
  models.NewsCategory _category;

  NewsListWidget({Key key, @required models.NewsCategory category}): _category=category, super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsListWidgetState(_category);
  }
}


class _NewsListWidgetState extends State<NewsListWidget> {
  // news category
  models.NewsCategory _category;

  _NewsListWidgetState(this._category);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('${_category.name}'),);
  }
}