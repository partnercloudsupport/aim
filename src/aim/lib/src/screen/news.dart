import 'package:flutter/material.dart';

import '../model/news.dart';
import '../remote/service.dart';

import '../widget/loader.dart';
import '../widget/news.dart';


class NewsHomePage extends StatelessWidget {
  NewsHomePage({Key key}): super(key: key);

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
