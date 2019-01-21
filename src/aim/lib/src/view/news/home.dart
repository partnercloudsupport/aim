import 'dart:core';
import 'package:flutter/material.dart';

import '../../model/news.dart';
import '../../remote/service.dart';

import '../widget/pager.dart';
import '../widget/loader.dart';


class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AsyncLoader(
      loader: () async{
        return await RemoteService.fetchNewsCategories();
      },
      builder: (context, categories) {
        return _NewsTabsWidget(categories: categories);
      },
    );
  }
}


class _NewsTabsWidget extends StatelessWidget {
  final ModelNewsCategories categories;

  _NewsTabsWidget({Key key, @required this.categories}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.items.length,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                  isScrollable: true,
                  tabs: categories.items.map((category) {
                    return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);
                  }).toList()
              ),
            ),
            body: TabBarView(
                children: categories.items.map((category) {
                  return _NewsListWidget(category: category);
                }).toList()
            )
        )
    );
  }
}


// news list
class _NewsListWidget extends StatelessWidget {
  final ModelNewsCategory category;
  _NewsListWidget({Key key, @required this.category}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagingLoadController(
      rpc: RpcGetNewsItems,
      params: {'category':category.code},
      itemBuilder: (context, item){
        return NewsItemWidget(item: item);
      },
    );
  }
}
