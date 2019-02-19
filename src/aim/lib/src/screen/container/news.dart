import 'package:flutter/material.dart';
import 'app.dart';
import '../widget/news.dart';
import '../../app.dart';
import '../../model/news.dart';
import '../../state/app.dart';
import '../../state/news.dart';
import '../../action/news.dart';

class NewsContainer extends StatelessWidget {
  final Function(ModelNewsItem) onTap;
  NewsContainer({Key key, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DataContainer<NewsCategories> (
      init: (store) {
        if(store.state.appTab == AppTab.news && !store.state.newsCategories.isUsable){
          store.dispatch(ActionGetNewsCategories());
        }
      },
      select: (store) {
        return store.state.newsCategories;
      },
      builder: (context, state){
        return NewsPageWidget(selected: state.selected, categories: state.categories, onTap: this.onTap);
      },
    );
  }
}

class NewsPageWidget extends StatelessWidget {
  final int selected;
  final List<ModelNewsCategory> categories;
  final Function(ModelNewsItem) onTap;
  NewsPageWidget({Key key, this.selected, this.categories, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: this.categories?.length??0,
      initialIndex: this.selected,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: NewsTabBarWidget(categories: this.categories),
        ),
        body: NewsTabViewWidget(categories: this.categories, onTap: this.onTap),
      ),
    );
  }
}

class NewsTabBarWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;

  NewsTabBarWidget({Key key, @required this.categories}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        isScrollable: true,
        tabs: this.categories?.map<Widget>((category) {return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);})?.toList()
    );
  }
}

class NewsTabViewWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;
  final Function(ModelNewsItem) onTap;
  NewsTabViewWidget({Key key, @required this.categories, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: this.categories?.map<Widget>((category) {
        return NewsPageListWidget(
          category: category,
          query: (page) async {
            return await App.remote.news.getNewsItems(category.code, page);
          },
          onTap: this.onTap
        );
      })?.toList()??[]
    );
  }
}
