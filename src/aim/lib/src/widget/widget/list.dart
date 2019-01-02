import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


typedef void OnRefresh();
typedef void OnLoadMore();

class PPListWidget extends StatelessWidget {
  final PPListController controller;
  final OnRefresh onRefresh;
  final OnLoadMore onLoadMore;
  final ScrollView child;


  PPListWidget({Key key, @required this.child, this.onRefresh, this.onLoadMore, this.controller}):super(key:key);

  void _onRefresh(bool up) {
    if(up){
      onRefresh();
    } else {
      onLoadMore();
    }
  }

  Widget _buildHeader(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有更多数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }

  Widget _buildFooter(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有更多数据',
      releaseText: '松开加载数据',
      refreshingText: '数据加载中...',
      completeText: '加载完成',
      failedText: '加载数据失败',
      idleText: '上拉加载',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.controller,
      enablePullUp: true,
      enablePullDown: true,
      onRefresh: _onRefresh,
      headerBuilder: _buildHeader,
      footerBuilder: _buildFooter,
      child: child,
    );
  }
}

class PPListController {
  final RefreshController controller = RefreshController();

  void refresh() {
    controller.requestRefresh(true);
  }

  void load() {
    controller.requestRefresh(false);
  }

  void notifyRefreshCompleted() {
    controller.sendBack(true, RefreshStatus.completed);
  }

  void notifyRefreshFailed() {
    controller.sendBack(true, RefreshStatus.failed);
  }

  void notifyLoadMoreCompleted() {
    controller.sendBack(false, RefreshStatus.completed);
  }

  void notifyLoadMoreFailed() {
    controller.sendBack(false, RefreshStatus.failed);
  }

  void notifyHasMoreData() {
    controller.sendBack(false, RefreshStatus.idle);
  }

  void notifyNoMoreData() {
    controller.sendBack(false, RefreshStatus.noMore);
  }
}