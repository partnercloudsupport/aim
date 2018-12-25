import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class PushToRefreshExamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PushToRefreshExamplePageState();
  }
}


class _PushToRefreshExamplePageState extends State<PushToRefreshExamplePage> {
  List<int> _items = [];
  RefreshController _refreshController = RefreshController();

  bool reverse = false;

  void _onRefresh(bool up) {
    if (up) {
      _refreshData();
    } else {
      _loadMore();
    }
  }

  void _loadMore(){
    // load more
    Future.delayed(Duration(seconds: 1)).then((value){
      setState(() {
        if(reverse){
          var lastValue = _items.length==0 ? 0 : _items.last;
          for (var i=1; i<=10; i++) {
            _items.add(lastValue+i);
          }
          _refreshController.sendBack(false, RefreshStatus.idle);
        } else {
          _refreshController.sendBack(false, RefreshStatus.idle);
        }
        reverse = !reverse;
      });
    });
  }

  void _refreshData() {
    // refresh
    Future.delayed(Duration(seconds: 1)).then((value){
      setState(() {
        if(reverse){
          var firstValue = _items.length==0 ? 0 : _items.first;
          for (var i=1; i<=10; i++) {
            _items.insert(0, firstValue-i);
          }
          _refreshController.sendBack(true, RefreshStatus.completed);
        } else {
          _refreshController.sendBack(true, RefreshStatus.failed);
        }
        reverse = !reverse;
      });
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 30)).then((value){
      _refreshController.requestRefresh(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          onPressed: ()=>Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text('pull to refresh example'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index){
            return Card(
              child: Center(child:Text(_items[index].toString())),
            );
          },
        ),
      ),
    );
  }
}