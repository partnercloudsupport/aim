import 'package:flutter/material.dart';
import 'pager.dart';
import 'webview.dart';
import '../../theme.dart';
import '../../util/time.dart';
import '../../model/news.dart';

// news list with pager widget
class NewsPageListWidget extends StatelessWidget {
  final ModelNewsCategory category;
  final Future Function(int page) query;
  final Function(ModelNewsItem) onTap;
  NewsPageListWidget({Key key, @required this.category, @required this.query, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return PagerWidget<ModelNewsItem>(
      query: this.query,
      builder: (context, item){
        return NewsItemWidget(
          item: item,
          onTap: this.onTap,
        );
      },
    );
  }
}


// news list widget
class NewsListWidget extends StatelessWidget {
  final List<ModelNewsItem> items;
  final Function(ModelNewsItem) onTap;

  NewsListWidget({Key key, @required this.items, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.items?.length??0,
      itemBuilder: (context, index){
        return NewsItemWidget(
          item: this.items[index],
          onTap: this.onTap,
        );
      }
    );
  }
}

// news item widget
class NewsItemWidget extends StatelessWidget {
  final ModelNewsItem item;
  final Function(ModelNewsItem) onTap;

  NewsItemWidget({Key key, @required this.item, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsItemMixedWidget(item: this.item),
          onPressed: () {
            if(this.onTap != null){
              this.onTap(this.item);
            }
          },
        ),
        Divider(height: 8.0)
      ],
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
                  style: AppTheme.text.newsBrief,
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
                style: AppTheme.text.newsSource,
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
                            style: AppTheme.text.newsTitle,
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
                          style: AppTheme.text.newsSource,
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
              style: AppTheme.text.newsTitle,
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
              style: AppTheme.text.newsSource,
            ),
          ),
        ],
      ),
    );
  }
}

