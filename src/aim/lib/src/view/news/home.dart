import 'dart:core';
import 'package:flutter/material.dart';

import '../../model/news.dart';
import '../../remote/service.dart';

import '../widget/loader.dart';

import 'widget/tab.dart';

class NewsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoaderWidget<ModelNewsCategories>(
      action: () async {
        return await RemoteService.fetchNewsCategories();
      },
      builder: (context, categories){
        return NewsTabsWidget(categories: categories?.items);
      },
    );
  }
}


