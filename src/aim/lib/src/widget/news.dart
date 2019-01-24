import 'package:flutter/material.dart';

import '../util/time.dart';
import '../model/news.dart';
import '../remote/all.dart';

import '../theme.dart';

import 'pager.dart';
import 'web.dart';


class NewsTabsWidget extends StatelessWidget {
  final List<ModelNewsCategory> categories;

  NewsTabsWidget({Key key, @required this.categories}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories?.length??0,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                  isScrollable: true,
                  tabs: categories?.map((category) {
                    return Tab(child: Text(category.name, style: TextStyle(fontSize: 16.0),),);
                  })?.toList()
              ),
            ),
            body: TabBarView(
                children: categories?.map((category) {
                  return NewsListWidget(
                      key: PageStorageKey(category.code),
                      category: category
                  );
                })?.toList()
            )
        )
    );
  }
}

// news category items list widget
class NewsListWidget extends StatefulWidget {
  final ModelNewsCategory category;
  NewsListWidget({Key key, @required this.category}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewsListWidgetState();
  }
}

class _NewsListWidgetState extends State<NewsListWidget> with AutomaticKeepAliveClientMixin{
  int page = 0;
  List<ModelNewsItem> items = [];

  Future<void> _onLoadFirstPage() async {
    this.page = 1;
    var result = await RemoteService.fetchNewsItems(widget.category.code, this.page);
    if(this.mounted){
      setState(() {
        this.items = result?.items??[];
      });
    }
  }

  Future<void> _onLoadNextPage() async {
    this.page += 1;
    var result = await RemoteService.fetchNewsItems(widget.category.code, this.page);

    if(this.mounted){
      setState(() {
        this.items.addAll(result?.items??[]);
      });
    }

    var total = result?.total??0;
    if (this.page > total) {
      this.page = total;
      throw NoMoreDataException();
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return PagerWidget(
      enablePull: true,
      onPullDown: _onLoadFirstPage,
      enablePush: true,
      onPushUp: _onLoadNextPage,
      child: ListView.builder(
        key: PageStorageKey<String>(widget.category.code),
        itemCount: this.items.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: NewsItemMixedWidget(item: this.items[index]),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){return WebPage(title: this.items[index].title, url: this.items[index].url);}));
                },
              ),
              Divider(height: 8.0)
            ],
          );
        },
      ),
    );
  }
}


// mixed news item widget
class NewsItemMixedWidget extends StatelessWidget {
  final ModelNewsItem item;
  NewsItemMixedWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if((this.item.images?.length??0) >2) {
      return NewsItemImage3Widget(item: this.item);
    } else if ((this.item.images?.length??0)>0){
      return NewsItemImage1Widget(item: this.item);
    } else {
      return NewsItemImage0Widget(item: this.item);
    }
  }
}

// news item with no image
class NewsItemImage0Widget extends StatelessWidget {
  final ModelNewsItem item;
  NewsItemImage0Widget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
                width: double.infinity,
                child: Text(
                  item.brief == null ? item.title : item.brief,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AimTheme.text.newsBrief,
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                '${item.source != null ? item.source : '--'} · ${item.ptime != null ? TimeFormat.format(item.ptime) : '--'}',
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AimTheme.text.newsSource,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// news item with one image
class NewsItemImage1Widget extends StatelessWidget {
  final ModelNewsItem item;
  NewsItemImage1Widget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 3,
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            item.title,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AimTheme.text.newsTitle,
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          '${item.source != null ? item.source : '--'} · ${item.ptime != null ? TimeFormat.format(item.ptime) : '--'}',
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AimTheme.text.newsSource,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(1.0),
                alignment: Alignment.center,
                child: Image.network(
                  item.images[0],
                ),
              ))
        ],
      ),
    );
  }
}

// news item with three image
class NewsItemImage3Widget extends StatelessWidget {
  final ModelNewsItem item;
  NewsItemImage3Widget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              item.title,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AimTheme.text.newsTitle,
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      item.images[0],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      item.images[1],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      item.images[2],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              '${item.source != null ? item.source : '--'} · ${item.ptime != null ? TimeFormat.format(item.ptime) : '--'}',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AimTheme.text.newsSource,
            ),
          ),
        ],
      ),
    );
  }
}

