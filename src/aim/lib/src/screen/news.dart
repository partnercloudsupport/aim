import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/app.dart';
import '../state/news.dart';
import '../model/news.dart';
import '../action/news.dart';
import '../remote/all.dart';

import '../widget/web.dart';
import '../widget/loader.dart';

import 'widget/news.dart';
import 'container/builder.dart';


class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, NewsState> (
        onInit: (store){
          if(Selector.activeTab(store.state) == AppTab.news && Selector.news(store.state).isTodo){
            store.dispatch(ActionLoadNewsData());
          }
        },
        ignoreChange: (state) {
          return Selector.activeTab(state) != AppTab.news;
        },
        onDidChange: (newsState){
          var store = StoreProvider.of<AppState>(context);
          if (Selector.activeTab(store.state)==AppTab.news && newsState.isTodo){
            store.dispatch(ActionLoadNewsData());
          }
        },
        converter: (store){
          return Selector.news(store.state);
        },
        builder: (context, newsState){
          return StateBuilder(
            state: newsState,
            action: () {
              StoreProvider.of<AppState>(context).dispatch(ActionLoadNewsData());
            },
            builder: (context, newsState){
              return DefaultTabController(
                  length: newsState?.categories?.length??0,
                  initialIndex: 0,
                  child: Scaffold(
                      appBar: AppBar(
                        centerTitle: true,
                        title: TabBar(
                            isScrollable: true,
                            tabs: newsState?.categories?.map<Widget>((category) {return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);})?.toList()
                        ),
                      ),
                      body: TabBarView(
                          children: newsState?.categories?.map<Widget>((category) {
                            return ListLoader<ModelNewsItem>(
                              keepAlive: false,
                              load: (page) async{
                                return await Remote.news.getNewsItems(category.code, page);
                              },
                              builder: (context, item){
                                return NewsListItemWidget(
                                  item: item,
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context){return WebPage(title: item?.title, url: item?.url);}));
                                  },
                                );
                              },
                            );
                          })?.toList()
                      )
                  )
              );
            },
          );
        },
      ),
    );
  }
}