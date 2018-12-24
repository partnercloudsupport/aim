import 'package:flutter/material.dart';

import '../../models.dart';
import '../../datas.dart';

import '../widgets.dart';
import 'news_item.dart';

// news list of category tab
class NewsListWidget extends StatefulWidget {
  final ModelNewsCategory category;

  NewsListWidget({Key key, @required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NewsListWidgetState();
  }
}

class NewsListWidgetState extends State<NewsListWidget> with AutomaticKeepAliveClientMixin {
  // news items
  List<ModelNewsItem> _newsItems;
  // list refresh controller
  ListLoaderController _controller = ListLoaderController();

  // test flag
  bool _reversed = true;

  @override
  bool get wantKeepAlive => true;

  void _refresh() {
    Future.delayed(Duration(seconds: 1)).then((val){
      setState(() {
        _newsItems = List<ModelNewsItem>.from(_reversed ? TestData.newsItemsList.reversed : TestData.newsItemsList);
        _reversed = !_reversed;
      });
      _controller.notifyRefreshCompleted();
    });
  }

  void _loadMore() {
    Future.delayed(Duration(seconds: 1)).then((val){
      setState(() {
        if(_newsItems == null){
          _newsItems = List<ModelNewsItem>.from(TestData.newsItemsList);
        } else {
          _newsItems.addAll(TestData.newsItemsList);
          _controller.notifyHasMoreData();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    if(_newsItems == null){
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return ListLoaderWidget(
      controller: _controller,
      onRefresh: _refresh,
      onLoadMore: _loadMore,
      child: ListView.builder(
        itemCount: _newsItems.length,
        itemBuilder: (context, index) {
          return NewsItemWidget(item: _newsItems[index]);
        }
      ),
    );
  }
}