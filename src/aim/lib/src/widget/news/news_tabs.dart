import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../models.dart';
import '../../reduxs.dart';

import 'news_list.dart';

// news tabs of category
class NewsTabsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewsTabsWidgetState();
  }
}

class NewsTabsWidgetState extends State<NewsTabsWidget> {
  @override
  void deactivate() {
    // save current selected categories
    var index = DefaultTabController.of(context).index;
    StoreProvider.of<AppState>(context).dispatch(ActionSwitchNewsCategories(index));

    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ModelNewsCategory>>(
        converter: (store)=>store.state.newsCategories.categories,
        builder: (context, categories) {
          return Scaffold(
              appBar: AppBar(
                title: TabBar(
                    isScrollable: true,
                    tabs: categories.map((category) {
                      return Tab(text: category.name);
                    }).toList()
                ),
              ),
              body: TabBarView(
                  children: categories.map((category) {
                    return NewsListWidget(category: category);
                  }).toList()
              )
          );
        }
    );
  }
}
