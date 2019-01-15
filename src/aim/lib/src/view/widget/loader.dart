import 'package:flutter/material.dart';

import '../../redux/state/const.dart';
import '../../remotes.dart' show Rpc;

// load status for loader
enum LoadStatus {loading, loaded, failed}
// widget builder with item data
typedef Widget ItemBuilder(BuildContext context, item);

// rpc loader widget
class RpcLoadController extends StatefulWidget {
  final Rpc rpc; //rpc service
  final Map params; //rpc request parameters

  final ItemBuilder child; //widget build by data item object

  RpcLoadController({@required this.rpc, this.params, @required this.child});

  @override
  State<StatefulWidget> createState() {
    return _RpcLoadControllerState();
  }
}


class _RpcLoadControllerState extends State<RpcLoadController> {
  LoadStatus _status = LoadStatus.loading;
  String _error;

  dynamic _model;

  void _load() {
    if (_status != LoadStatus.loading) {
      setState(() {
        _status = LoadStatus.loading;
      });
    }

    widget.rpc.request(data: widget.params).then((model){
      setState(() {
        _status = LoadStatus.loaded;
        _model = model;
      });
    }).catchError((error){
      setState(() {
        _status = LoadStatus.failed;
        _error = error.toString();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case LoadStatus.loading:
        return _buildLoading(context);
      case LoadStatus.loaded:
        return _buildLoaded(context);
      case LoadStatus.failed:
        return _buildFailed(context);
    }
  }

  Widget _buildLoading(context) {
    return Container(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildLoaded(context) {
    return Container(
      child: widget.child(context, _model),
    );
  }

  Widget _buildFailed(context) {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        child: Text('重试'),
        onPressed: () {
          _load();
        }
      ),
    );
  }
}


class LoadingController extends StatelessWidget {
  final Status status;

  final String error;
  final Function onReload;

  final Widget loading;
  final Widget loaded;
  final Widget failed;

  LoadingController({Key key, @required this.status, this.error, this.onReload, this.loading, this.loaded, this.failed}):super(key:key);


  int getIndex() {
    switch(status) {
      case Status.loading:
        return 0;
      case Status.loaded:
        return 1;
      case Status.failed:
        return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: getIndex(),
      children: <Widget>[
        loading!=null ? loading : LoadingIndicatorWidget(),
        LoadedIndicatorWidget(child: loaded),
        failed!=null ?failed : FailedIndicatorWidget(error: error, onReload: onReload)
      ],
    );
  }
}


class LoadingIndicatorWidget extends StatelessWidget {
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


class LoadedIndicatorWidget extends StatelessWidget {
  final Widget child;
  LoadedIndicatorWidget({Key key, @required this.child}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: this.child,
    );
  }
}


class FailedIndicatorWidget extends StatelessWidget {
  final String error;
  final Function onReload;

  FailedIndicatorWidget({Key key, this.error, this.onReload}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: Duration(milliseconds: 800),
      child: FlatButton(
        child: Center(
          child: this.error!=null ? this.error : Text('加载失败，点击屏幕重试'),
        ),
        onPressed: (){
          if(this.onReload != null)
            this.onReload();
        },
      ),
    );
  }
}

