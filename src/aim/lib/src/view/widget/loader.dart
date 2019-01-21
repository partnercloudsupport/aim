import 'package:flutter/material.dart';


// function for load action
typedef AsyncLoadAction = Future<dynamic> Function() ;
// function for build widget after load succeed
typedef AsyncLoadBuilder = Widget Function(BuildContext context, dynamic data);
// load status
enum AsyncLoadStatus {loading, loaded, failed}

/// async loader for widget
class AsyncLoader extends StatefulWidget {
  final AsyncLoadAction loader;
  final AsyncLoadBuilder builder;

  AsyncLoader({
    Key key,
    @required this.loader,
    @required this.builder
  }):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return AsyncLoaderState();
  }
}


class AsyncLoaderState extends State<AsyncLoader> {
  // current load status
  AsyncLoadStatus _status;
  // data loaded
  dynamic _data;
  // error message for failure
  String _error;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  void load() async{
    try {
      // update state to loading
      setState(() {
        _status = AsyncLoadStatus.loading;
      });

      // load action
      _data = await widget.loader();

      // update state to loaded
      setState(() {
        _status = AsyncLoadStatus.loaded;
      });
    }catch(e) {
      // load failed
      setState(() {
        _status = AsyncLoadStatus.failed;
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch(_status){
      case AsyncLoadStatus.loading:
        return _LoadingIndicatorWidget();
      case AsyncLoadStatus.loaded:
        return widget.builder(context, _data);
      case AsyncLoadStatus.failed:
        return _FailureIndicatorWidget(error: _error, reloader: this.load,);
    }
  }
}


class _LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 500),
      child: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _FailureIndicatorWidget extends StatelessWidget {
  final String error;
  final AsyncLoadAction reloader;

  _FailureIndicatorWidget({Key key, this.error, this.reloader}):super(key: key);

  void reload() async {
    if (this.reloader != null){
      await this.reloader();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(this.error??'未知错误'),
              Text('加载失败，点击屏幕重试'),
            ],
          ),
        ),
        onPressed: (){
          this.reload();
        },
      ),
    );
  }
}

