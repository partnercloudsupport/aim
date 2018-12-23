import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models.dart';
import '../../datas.dart';

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
  final RefreshController _refreshController = RefreshController();
  bool _isLoading = false;

  @override
  bool get wantKeepAlive => true;

  void _onRefresh(bool up) {
    print('refresh: $up');
    Future.delayed(Duration(seconds: 3)).then((val){
      if(up){
        _refreshController.sendBack(up, RefreshStatus.completed);
      } else {
        _loadMoreItems();
        _refreshController.sendBack(up, RefreshStatus.canRefresh);
      }
    });
  }

  void _onOffsetChange(bool up, double offset) {
    //print('offset: $up, $offset');
  }

  void _loadMoreItems() {
    if(_isLoading){
      return;
    }
    _isLoading = true;

    Future.delayed(Duration(seconds: 3)).then((val){
      print('load more...');
      setState(() {
        List<ModelNewsItem> items = List<ModelNewsItem>.filled(5, TestData.newsItemsList[1]);
        TestData.newsItemsList.addAll(items);
        _isLoading = false;
      });
    });
  }

  Widget _buildHeader(context, mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '已没有更多数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }

  Widget _buildFooter(context, mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '已没有数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: _onRefresh,
      onOffsetChange: _onOffsetChange,
      headerBuilder: _buildHeader,
      footerBuilder: _buildFooter,
      child: ListView.builder(
          itemCount: TestData.newsItemsList.length,
          itemBuilder: (context, index) {
            if(TestData.newsItemsList.length-index < 5 && !_isLoading){
              _loadMoreItems();
            }
            return NewsItemWidget(item: TestData.newsItemsList[index]);
          }
      ),
    );
  }
}