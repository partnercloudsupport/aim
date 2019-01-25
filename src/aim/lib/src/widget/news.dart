import 'package:flutter/material.dart';

import '../util/time.dart';
import '../model/news.dart';
import '../theme.dart';


// news list item
class NewsListItemWidget extends StatelessWidget {
  final ModelNewsItem item;
  final Function() onTap;

  NewsListItemWidget({Key key, @required this.item, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: NewsItemMixedWidget(item: this.item),
          onPressed: this.onTap??(){},
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

