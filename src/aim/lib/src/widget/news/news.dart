import 'dart:core';
import 'package:flutter/material.dart';

import '../../models.dart';
import '../../remotes.dart';

import '../widgets.dart';
import 'news_tabs.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RpcLoadController(
      rpc: RpcGetNewsCategories,
      child: (context, model) {
        return _NewsCategoriesWidget(categories: model.items);
      }
    );
  }
}

class _NewsCategoriesWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;

  _NewsCategoriesWidget({Key key, @required this.categories}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        initialIndex: 0,
        child: NewsTabsWidget(categories: categories)
    );;
  }
}

