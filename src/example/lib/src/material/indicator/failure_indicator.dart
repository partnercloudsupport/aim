import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class FailureIndicatorExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FailureIndicatorExampleState();
  }
}

class FailureIndicatorExampleState extends State<FailureIndicatorExample> {
  bool succeed = false;

  void retry() {
    setState(() {
      this.succeed = !this.succeed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'failure',
      child: this.succeed ? Center(child: Text('加载成功'),) : FailureIndicatorWidget(msg: '网络asdasdsadasdasdasdasdasdasdasdasdasdddddddd超时', retry: this.retry),
    );
  }
}

class FailureIndicatorWidget extends StatelessWidget {
  final String msg;
  final Function() retry;
  FailureIndicatorWidget({Key key, this.msg, this.retry}): super(key: key);

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
