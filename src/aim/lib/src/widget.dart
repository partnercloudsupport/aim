import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'state/app.dart';
import 'state/base.dart';

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
