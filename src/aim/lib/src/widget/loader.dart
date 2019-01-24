import 'package:flutter/material.dart';

// loader status
enum LoaderStatus { loading, loaded, failed }

// loader state
class LoaderState<ViewModel> {
  LoaderStatus status;
  String msg;
  ViewModel data;

  LoaderState({@required this.status, this.msg, this.data});

  factory LoaderState.loading() => LoaderState(status: LoaderStatus.loading);
  factory LoaderState.loaded(dynamic data) => LoaderState(status: LoaderStatus.loaded, data: data);
  factory LoaderState.failed(String msg) => LoaderState(status: LoaderStatus.failed, msg: msg);
}

// loader action
typedef LoaderAction<ViewModel> = Future Function();
// loader builder
typedef LoaderBuilder<ViewModel> = Widget Function(BuildContext context, ViewModel data);

// loader widget
class LoaderWidget<ViewModel> extends StatefulWidget {
  // loader action
  final LoaderAction<ViewModel> action;
  // child builder
  final LoaderBuilder<ViewModel> builder;

  LoaderWidget({Key key, @required this.action, @required this.builder}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoaderWidgetState<ViewModel>();
  }
}

// loader widget
class _LoaderWidgetState<ViewModel> extends State<LoaderWidget<ViewModel>> {
  // load state
  LoaderState<ViewModel> state;

  @override
  void initState() {
    super.initState();
    this.load();
  }

  // load action
  void load() async {
    try {
      // update state to loading
      setState(() {
        state = LoaderState.loading();
      });

      // load action
      var data = await widget.action();

      // update state to loaded
      setState(() {
        state = LoaderState.loaded(data);
      });
    } catch (e) {
      // load failed
      setState(() {
        state = LoaderState.failed(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch(this.state.status){
      case LoaderStatus.loading:
        child = AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 500),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
        break;
      case LoaderStatus.failed:
        child = AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(milliseconds: 800),
          child: FlatButton(
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(this.state?.msg ?? '未知错误'),
                  Text('加载失败，点击屏幕重试'),
                ],
              ),
            ),
            onPressed: () {
              widget.action ?? widget.action();
            },
          ),
        );
        break;
      case LoaderStatus.loaded:
        child = widget.builder(context, state.data);
        break;
    }
    return child;
  }
}
