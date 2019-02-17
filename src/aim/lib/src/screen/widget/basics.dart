import 'package:flutter/material.dart';

// to load indicator
class ToLoadIndicator extends StatelessWidget {
  // load function callback
  final void Function() load;

  ToLoadIndicator({Key key, this.load}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('待加载', textAlign: TextAlign.center,),
            Text('点击屏幕加载', style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
      onPressed: () {
        if(this.load != null)
          this.load();
      },
    );
  }
}

// loading indicator for show an loading action
class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

// failure indicator widget for show failed message
class FailureIndicator extends StatelessWidget {
  final String msg;
  final void Function() retry;
  FailureIndicator({Key key, this.msg, this.retry}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(this.msg ?? '未知错误', textAlign: TextAlign.center,),
            Text('加载失败，点击屏幕重试', style: TextStyle(color: Colors.grey),),
          ],
        ),
      ),
      onPressed: () {
        if(this.retry!=null)
          this.retry();
      },
    );
  }
}
