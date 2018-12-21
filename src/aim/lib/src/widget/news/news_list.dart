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

  @override
  bool get wantKeepAlive => true;

  void _onRefresh(bool up) {
    print('refresh: $up');
    Future.delayed(Duration(seconds: 3)).then((val){
      if(up){
        _refreshController.sendBack(up, RefreshStatus.completed);
      } else {
        TestData.newsItemsList.addAll(TestData.newsItemsList);
        setState(() {

        });
        _refreshController.sendBack(up, RefreshStatus.canRefresh);
      }
    });
  }

  void _onOffsetChange(bool up, double offset) {
    print('offset: $up, $offset');
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
            print('list: $index');
            return NewsItemWidget(item: TestData.newsItemsList[index]);
          }
      ),
    );
  }
}