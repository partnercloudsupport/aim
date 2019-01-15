import 'package:flutter/material.dart';

import '../../scaffold_page.dart';



class StackExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StackExampleState();
  }
}


enum Status {todo, doing, done, failed}

class StackExampleState extends State<StackExample> {
  Status status = Status.todo;
  Status next = Status.done;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() {
    status = Status.doing;
    Future.delayed(Duration(seconds: 3)).then((value){
      setState(() {
        status = next;
        next = next==Status.done ? Status.failed : Status.done;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
        title: 'stack',
        child: Stack(
          children: <Widget>[
            DoingWidget(status: status),
            DoneWidget(status: status),
            FailedWidget(status: status, retry:this.load)
          ],
        )
    );
  }
}


class DoingWidget extends StatelessWidget {
  final Status status;

  DoingWidget({Key key, @required this.status}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: status==Status.doing ? 1.0 : 0.0,
      duration: Duration(milliseconds: 800),
      child: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class DoneWidget extends StatelessWidget {
  final Status status;
  Function reload;

  DoneWidget({Key key, @required this.status, this.reload}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: status==Status.done ? 1.0 : 0.0,
      duration: Duration(milliseconds: 800),
      child: Container(
        alignment: Alignment.center,
        child:FlatButton(
          color: Colors.green,
          child: Text('加载成功，重新加载'),
          onPressed: (){
            if(reload != null)
              reload();
            print('reload');
          },
        ),
      ),
    );
  }
}


class FailedWidget extends StatelessWidget {
  final Status status;
  Function retry;

  FailedWidget({Key key, @required this.status, this.retry}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: status==Status.failed ? 1.0 : 0.0,
      duration: Duration(milliseconds: 800),
      child: Container(
        alignment: Alignment.center,
        child: FlatButton(
          color: Colors.red,
          child: Text('加载失败，点击重试'),
          onPressed: (){
            if(retry != null)
              retry();
            print('retry');
          },
        ),
      ),
    );
  }
}