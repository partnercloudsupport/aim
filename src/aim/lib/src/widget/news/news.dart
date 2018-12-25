import 'dart:core';
import 'package:flutter/material.dart';

import '../../models.dart';
import '../../remotes.dart' as remotes;
import 'news_tabs.dart';


class NewsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsPageStage();
  }
}

class _NewsPageStage extends State<NewsPage> {
  // news categories
  List<ModelNewsCategory> _categories;

  void _loadCategories() {
    remotes.getNewsCategories().then((categories){
      setState(() {
        _categories = categories;
      });
    }).catchError((){
      setState(() {

      });
    });
  }

  @override
  void initState() {
    super.initState();
    // load categories
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    if (_categories == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return DefaultTabController(
      length: _categories.length,
      initialIndex: 0,
      child: NewsTabsWidget(categories: _categories)
    );
  }
}
