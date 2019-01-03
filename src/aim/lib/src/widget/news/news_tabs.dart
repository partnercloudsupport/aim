import 'dart:core';
import 'package:flutter/material.dart';

import '../../models.dart';
import 'news_list.dart';


class NewsTabsWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;

  NewsTabsWidget({Key key, @required this.categories}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                  isScrollable: true,
                  tabs: categories.map((category) {
                    return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);
                  }).toList()
              ),
            ),
            body: TabBarView(
                children: categories.map((category) {
                  return NewsListWidget(category: category);
                }).toList()
            )
        )
    );
  }
}