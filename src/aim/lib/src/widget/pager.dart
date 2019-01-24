import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// no more data
class NoMoreDataException implements Exception {}

typedef OnPullDown = Future<void> Function();
typedef OnPushUp = Future<void> Function();

/// pull/push page loader
class PagerWidget extends StatefulWidget {
  final bool enablePull;
  final OnPullDown onPullDown;
  final bool enablePush;
  final OnPushUp onPushUp;
  final ScrollView child;

  PagerWidget({Key key, this.enablePull, this.onPullDown, this.enablePush, this.onPushUp, @required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PagerWidgetState();
  }
}

class _PagerWidgetState extends State<PagerWidget> {
  final RefreshController _controller = RefreshController();

  @override
  void initState() {
    super.initState();
    _refresh(false);
  }

  void _refresh(bool up) async {
    try {
      if (up) {
        if (widget.onPullDown != null) await widget.onPullDown();
        _controller.sendBack(up, RefreshStatus.completed);
      } else {
        if (widget.onPushUp != null) await widget.onPushUp();
        _controller.sendBack(up, RefreshStatus.idle);
      }
    } on NoMoreDataException catch (e) {
      _controller.sendBack(up, RefreshStatus.completed);
    } on Exception catch (e) {
      _controller.sendBack(up, RefreshStatus.failed);
    }
  }

  Widget _buildHeader(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有数据',
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
      noDataText: '没有数据',
      releaseText: '松开加载数据',
      refreshingText: '数据加载中...',
      completeText: '已经是最后一页了',
      failedText: '加载数据失败',
      idleText: '上拉加载',
    );
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _controller,
      enablePullUp: widget.enablePull ?? true,
      enablePullDown: widget.enablePush ?? true,
      onRefresh: _refresh,
      headerBuilder: _buildHeader,
      footerBuilder: _buildFooter,
      child: widget.child,
    );
  }
}
