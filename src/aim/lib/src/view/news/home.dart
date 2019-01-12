import 'dart:core';
import 'package:flutter/material.dart';

import '../../remotes.dart';
import '../widgets.dart';
import 'news_tabs.dart';


class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RpcLoadController(
      rpc: RpcGetNewsCategories,
      child: (context, model) {
        return NewsTabsWidget(categories: model.items);
      }
    );
  }
}

