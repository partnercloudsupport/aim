import 'package:flutter/material.dart';

import '../../scaffold_page.dart';


class IndexStackExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexStackExampleState();
  }
}


enum Status {doing, done, failed}

class IndexStackExampleState extends State<IndexStackExample> {
  Status status;
  Status next = Status.done;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() {
    setState(() {
      status = Status.doing;
    });
    Future.delayed(Duration(seconds: 3)).then((value){
      setState(() {
        status = next;
        next = next==Status.done ? Status.failed : Status.done;
      });
    });
  }

  int getIndex() {
    switch(status) {
      case Status.doing:
        return 0;
      case Status.done:
        return 1;
      case Status.failed:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
        title: 'index stack',
        child: IndexedStack(
          index: getIndex(),
          children: <Widget>[
            DoingWidget(),
            DoneWidget(reload: this.load,),
            FailedWidget(retry: this.load)
          ],
        )
    );
  }
}


class DoingWidget extends StatelessWidget {
  DoingWidget({Key key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class DoneWidget extends StatelessWidget {
  Function reload;

  DoneWidget({Key key, this.reload}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        color: Colors.green,
        child: Center(
          child: Text('加载成功，重新加载'),
        ),
        onPressed: (){
          if(reload != null)
            reload();
          print('reload');
        },
      ),
    );
  }
}


class FailedWidget extends StatelessWidget {
  Function retry;

  FailedWidget({Key key, this.retry}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        color: Colors.red,
        child: Center(
          child: Text('加载失败，点击重试'),
        ),
        onPressed: (){
          if(retry != null)
            retry();
          print('retry');
        },
      ),
    );
  }
}