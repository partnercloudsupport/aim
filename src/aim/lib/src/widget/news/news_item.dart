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
          padding: EdgeInsets.all(8.0),
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
          //color: Colors.black
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