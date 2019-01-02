import 'package:flutter/material.dart';

import '../../models.dart';
import '../../remotes.dart';

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
  // current page
  int page = 1;
  // news items
  List<ModelNewsItem> _newsItems = [];
  // list refresh controller
  ListLoaderController _controller = ListLoaderController();

  @override
  bool get wantKeepAlive => true;

  void _refresh() {
    // reset page
    page = 1;
    // request data
    RpcGetNewsItems.request(data:{'code':widget.category.code, 'page':page}).then((items){
      setState(() {
        _newsItems = items;
        _controller.notifyRefreshCompleted();
      });
    }).catchError((error){
      showError(context, error);
      _controller.notifyRefreshFailed();
    });
  }

  void _loadMore() {
    // request data
    RpcGetNewsItems.request(data:{'code': widget.category.code, 'page':page}).then((items){
      setState(() {
        _newsItems.addAll(items);
        _controller.notifyHasMoreData();
      });
    }).catchError((error){
      showError(context, error);
      _controller.notifyLoadMoreFailed();
    });    
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value){
      _controller.loadMore();
    });
  }

  @override
  Widget build(BuildContext context) {
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