import 'package:flutter/material.dart';


class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}


class FailureIndicator extends StatelessWidget {
  final String msg;
  final Future<void> Function() retry;
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
