import 'package:flutter/material.dart';

import '../../remotes.dart' show Rpc;
import 'list.dart';

// load status for loader
enum LoadStatus {loading, loaded, failed}
// widget builder with item data
typedef Widget ItemBuilder(BuildContext context, item);

// rpc loader widget
class WidgetLoadController extends StatefulWidget {
  final Rpc rpc; //rpc service
  final Map params; //rpc request parameters

  final ItemBuilder child; //widget build by data item object

  WidgetLoadController({@required this.rpc, this.params, @required this.child});

  @override
  State<StatefulWidget> createState() {
    return _WidgetLoadControllerState();
  }
}


class _WidgetLoadControllerState extends State<WidgetLoadController> {
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


class PagingLoadController extends StatefulWidget {
  final Rpc rpc; //rpc service
  Map params = {}; //rpc request parameters

  final ItemBuilder itemBuilder; //item widget builder

  PagingLoadController({Key key, @required this.rpc, this.params, @required this.itemBuilder}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PagingLoadControllerState();
  }
}


class _PagingLoadControllerState extends State<PagingLoadController> with AutomaticKeepAliveClientMixin{
  // pplist controller
  final PPListController _controller = PPListController();
  // page list items
  List<dynamic> _items = [];
  // current page
  int _page = 0;

  void _loadFirstPage() {
    _page = 1;
    var params = Map.of(widget.params);
    params['page'] = _page;
    widget.rpc.request(data: params).then((model){
      if(model.items.length > 0) {
        setState(() {
          _items.addAll(model.items);
        });
      }
      _controller.notifyRefreshCompleted();
    }).catchError((error){
      _controller.notifyRefreshFailed();
    });
  }

  void _loadNextPage() {
    _page += 1;
    var params = Map.of(widget.params);
    params['page'] = _page;
    widget.rpc.request(data: params).then((model){
      if(model.items.length > 0){
        setState(() {
          _items.addAll(model.items);
        });

        if(_page < model.total){
          _controller.notifyHasMoreData();
        } else{
          _controller.notifyLoadMoreCompleted();
        }
      } else {
        _controller.notifyLoadMoreCompleted();
      }
    }).catchError((error){
      _controller.notifyLoadMoreFailed();
    });
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100)).then((value){
      _controller.load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PPListWidget(
      controller: _controller,
      onRefresh: _loadFirstPage,
      onLoadMore: _loadNextPage,
      child: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index){
          return widget.itemBuilder(context, _items[index]);
        },
      ),
    );
  }
}