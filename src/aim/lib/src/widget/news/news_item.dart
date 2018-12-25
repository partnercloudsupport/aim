import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import '../../models.dart';
import '../../config.dart';
import '../../utils.dart';

import 'news_detail.dart';

// news item of list
class NewsItemWidget extends StatelessWidget {
  final ModelNewsItem item;

  NewsItemWidget({Key key, @required this.item}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: StyleConfig.card,
      margin: EdgeInsets.only(top: 1.0, bottom: 1.0),
      child: FlatButton(
        padding: EdgeInsets.all(8.0),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>NewsDetailPage(title: item.title, url: 'https://emwap.eastmoney.com/info/detail/201812251013511436',)));
        },
        child: item.images.length==0 ? _NewsItemWithoutImage(item: item) : item.images.length<3 ? _NewsItemWithOneImage(item: item) : _NewsItemWithThreeImage(item: item)
      ),
    );
  }
}

// news item without image
class _NewsItemWithoutImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithoutImage({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _NewsTitleWidget(title: item.title),
        _NewsSourceWidget(source: item.source, time: item.ptime),
      ],
    );
  }
}

// news item with 1 image
class _NewsItemWithOneImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithOneImage({Key key, @required this.item}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Column(
            children: <Widget>[
              _NewsTitleWidget(title: item.title),
              _NewsSourceWidget(source: item.source, time: item.ptime),
            ],
          ),
        ),
        
        Expanded(
          flex: 1, 
          child: _NewsImageWidget(src: item.images[0])
        )
      ],
    );
  }
}

// news item with 3 image
class _NewsItemWithThreeImage extends StatelessWidget {
  final ModelNewsItem item;
  _NewsItemWithThreeImage({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        _NewsTitleWidget(title: item.title),
        Row(
          children: <Widget>[
            Expanded(
              child: _NewsImageWidget(src: item.images[0])
            ),
            Expanded(
                child: _NewsImageWidget(src: item.images[1])
            ),
            Expanded(
                child: _NewsImageWidget(src: item.images[2])
            ),
          ],
        ),
        _NewsSourceWidget(source: item.source, time: item.ptime),
      ],
    );
  }
}

// news title
class _NewsTitleWidget extends StatelessWidget {
  final String title;

  _NewsTitleWidget({Key key, @required this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        maxLines: 3,
        style: TextStyle(
          fontSize: 18.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.topLeft,
    );
  }
}

// news image
class _NewsImageWidget extends StatelessWidget {
  final String src;
  final double height;
  final double width;

  _NewsImageWidget({Key key, @required this.src, this.height=95.0, this.width}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      padding: EdgeInsets.all(1.0),
      child: Image.network(
        src,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
      ),
    );
  }
}

// news source and publish time
class _NewsSourceWidget extends StatelessWidget {
  final String source;
  final int time;
  _NewsSourceWidget({Key key, this.source, this.time}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
      child: Text(
        '${source!=null ? source : '--'} · ${time!=null ? TimeFormat.format(time) : '--'}',
        style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey
        ),
      ),
    );
  }
}