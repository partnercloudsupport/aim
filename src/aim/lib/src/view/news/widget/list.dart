import 'package:flutter/material.dart';

import '../../../model/news.dart';
import '../../../remote/service.dart';

import '../../widget/pager.dart';

import 'item.dart';


// news list widget
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
  List<ModelNewsItem> _items = [];

  Future<void> _onLoadFirstPage() async {
    this.page = 1;
    var result = await RemoteService.fetchNewsItems(widget.category.code, this.page);
    if(this.mounted){
      setState(() {
        _items = result?.items??[];
      });
    }
  }

  Future<void> _onLoadNextPage() async {
    this.page += 1;
    var result = await RemoteService.fetchNewsItems(widget.category.code, this.page);

    if(this.mounted){
      setState(() {
        _items.addAll(result?.items??[]);
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
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return NewsItemWidget(item: _items[index]);
        },
      ),
    );
  }
}