import 'package:flutter/material.dart';

import '../../../model/news.dart';

import 'list.dart';

class NewsTabsWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;

  NewsTabsWidget({Key key, @required this.categories}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories?.length??0,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                  isScrollable: true,
                  tabs: categories?.map((category) {
                    return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);
                  })?.toList()
              ),
            ),
            body: TabBarView(
                children: categories?.map((category) {
                  return NewsListWidget(
                    key: PageStorageKey(category.code),
                    category: category
                  );
                })?.toList()
            )
        )
    );
  }
}