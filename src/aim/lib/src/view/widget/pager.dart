import 'package:flutter/material.dart';
import 'list.dart';

import '../../remotes.dart' show Rpc;

// load status for loader
enum LoadStatus {loading, loaded, failed}
// widget builder with item data
typedef Widget ItemBuilder(BuildContext context, item);


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


