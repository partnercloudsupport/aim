import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../models.dart';
import '../reduxs.dart';


class NewsWidget extends StatelessWidget {
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


// news list of category tab
class NewsListWidget extends StatelessWidget {
  final ModelNewsCategory category;
  NewsListWidget({Key key, @required this.category}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Text('test'),);
  }
}


// news item of list
class NewsItemWidget extends StatelessWidget {
  final ModelNewsItem item;
  NewsItemWidget({Key key, @required this.item}): super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}