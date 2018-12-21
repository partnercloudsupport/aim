import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../reduxs.dart';

import 'news_tabs.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StateNewsCategories>(
      converter: (store)=>store.state.newsCategories,
      builder: (context, categories) {
        // load categories
        var appstate = StoreProvider.of<AppState>(context);
        if(categories == null || categories.status != 'succeed') {
          appstate.dispatch(ActionLoadNewsCategories());
          return Center(child: CircularProgressIndicator(),);
        }

        return DefaultTabController(
          length: categories.length,
          initialIndex: categories.selected??=0,
          child: NewsTabsWidget()
        );
      }
    );
  }
}
