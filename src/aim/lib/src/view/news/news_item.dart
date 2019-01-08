import 'package:flutter/material.dart';

import '../../utils.dart';
import '../../config.dart';
import '../../models.dart';
import '../../remotes.dart';

import '../widgets.dart';


// news item of list
class NewsItemWidget extends StatelessWidget {
  final ModelNewsItem item;

  NewsItemWidget({Key key, @required this.item}): super(key:key);

  Widget _buildItem() {
    if (item.images == null || item.images.length==0){
      return _NewsItemWithoutImage(item: item);
    } else {
      if (item.images.length < 3){
        return _NewsItemWithOneImage(item: item);
      } else {
        return _NewsItemWithThreeImage(item: item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StyleConfig.card,
      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
      child: FlatButton(
          padding: EdgeInsets.all(0.0),
          onPressed: (){
            Nav.push(context, (context){
              return WebViewPage(url:Url.news_detail(item.code));
            });
          },
          child: _buildItem()
        )
      );
  }
}

class _NewsItemWithoutImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithoutImage({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      color: Colors.white,
      margin: EdgeInsets.only(top: 1.0, bottom: 2.0),
      padding: EdgeInsets.all(5.0),
      child: Container(
        //height: 110.0,
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                child: Text(
                  item.brief==null ? item.title : item.brief,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    //fontWeight: FontWeight.w400
                  ),
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  '${item.source!=null ? item.source : '--'} · ${item.ptime!=null ? TimeFormat.format(item.ptime) : '--'}',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12.0,
                    //fontWeight: FontWeight.w400
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _NewsItemWithOneImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithOneImage({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top:1.0, bottom: 1.0),
      padding: EdgeInsets.all(5.0),
      child: Container(
        //height: 120.0,
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  height: 110.0,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              item.title,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                //fontWeight: FontWeight.w400
                              ),
                            ),
                          )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            '${item.source!=null ? item.source : '--'} · ${item.ptime!=null ? TimeFormat.format(item.ptime) : '--'}',
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12.0,
                              //fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),
            Expanded(
                flex: 1,
                child: Container(
                  //height: 110.0,
                  width: double.infinity,
                  padding: EdgeInsets.all(1.0),
                  alignment: Alignment.center,
                  child: Image.network(
                    item.images[0],
                    //height: 100.0,
                    //width: 130.0,
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}

class _NewsItemWithThreeImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithThreeImage({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180.0,
      color: Colors.white,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top:1.0, bottom: 1.0),
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              item.title,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                //fontWeight: FontWeight.w400
              ),
            ),
          ),
          Container(
            //height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(1.0),
                    child: Image.network(
                      item.images[0],
                      //height: 100.0,
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
                      //height: 100.0,
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
                      //height: 100.0,
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
              '${item.source!=null ? item.source : '--'} · ${item.ptime!=null ? TimeFormat.format(item.ptime) : '--'}',
              textAlign: TextAlign.left,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12.0,
                //fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    );
  }
}
