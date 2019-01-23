import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'states/base.dart';

import 'state.dart';


/// load widget with state status
class StateLoader extends StatelessWidget {
  // load state
  final LState state;
  // widget builder after load succeed
  final WidgetBuilder builder;
  // load action
  final dynamic actionRetry;

  StateLoader({Key key, @required this.state, @required this.builder, @required this.actionRetry}) : super(key: key);

  Widget loading() {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget failure(context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(this.state?.msg??'未知错误'),
              Text('加载失败，点击屏幕重试'),
            ],
          ),
        ),
        onPressed: (){
          StoreProvider.of<StateApp>(context).dispatch(this.actionRetry);
        },
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    switch(this.state.status) {
      case LStatus.toload:
        StoreProvider.of<StateApp>(context).dispatch(this.actionRetry);
        return this.loading();
      case LStatus.loading:
        return this.loading();
      case LStatus.failed:
        return this.failure(context);
      case LStatus.loaded:
        return builder(context);
    }
  }
}


/// pull/push refresh loader
class PPLoader extends StatelessWidget {
  final PPState state;
  final bool enablePull;
  final dynamic actionPull;
  final bool enablePush;
  final dynamic actionPush;
  final ScrollView child;

  final RefreshController _controller = RefreshController();

  PPLoader({Key key, @required this.state, this.enablePull, this.actionPull, this.enablePush, this.actionPush, @required this.child}):super(key: key);

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
      enablePullUp: this.enablePull??true,
      enablePullDown: this.enablePush??true,
      onRefresh: (up) {
        if(up){
          StoreProvider.of<StateApp>(context).dispatch(actionPull);
        } else {
          StoreProvider.of<StateApp>(context).dispatch(actionPush);
        }
      },
      headerBuilder: _buildHeader,
      footerBuilder: _buildFooter,
      child: this.child,
    );
  }
}
