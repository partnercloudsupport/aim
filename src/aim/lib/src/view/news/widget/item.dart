import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../../../models.dart';
import '../../../remotes.dart';

import '../../theme.dart';
import '../../widgets.dart';

// news item of list
class NewsItemWidget extends StatelessWidget {
  final ModelNewsItem item;

  NewsItemWidget({Key key, @required this.item}) : super(key: key);

  Widget _buildItem() {
    if (item.images == null || item.images.length == 0) {
      return _NewsItemWithoutImage(item: item);
    } else {
      if (item.images.length < 3) {
        return _NewsItemWithOneImage(item: item);
      } else {
        return _NewsItemWithThreeImage(item: item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            title: _buildItem(),
            onTap: () {
              Nav.push(context, (context) {
                return WebViewPage(url: PageUrl.newsDetail(item.code));
              });
            }),
        Divider(height: 0)
      ],
    );
  }
}

class _NewsItemWithoutImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithoutImage({Key key, @required this.item}) : super(key: key);

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

class _NewsItemWithOneImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithOneImage({Key key, @required this.item}) : super(key: key);

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

class _NewsItemWithThreeImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithThreeImage({Key key, @required this.item}) : super(key: key);

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
