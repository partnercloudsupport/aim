import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'basics.dart';

////// pager status ///////
// pager status
enum PagerStatus {loading, loaded, failed }
// pager state
class PagerState {
  PagerStatus status;
  String msg;

  PagerState({@required this.status, this.msg});

  factory PagerState.loading() => PagerState(status: PagerStatus.loading);
  factory PagerState.loaded([dynamic data]) => PagerState(status: PagerStatus.loaded);
  factory PagerState.failed(String msg) => PagerState(status: PagerStatus.failed, msg: msg);
}

/////////////// pager widget ////////////////
// no more page
class NoMorePage implements Exception {}

/// scroll widget loader
class PagerWidget<Item> extends StatefulWidget {
  // page loader callback
  final Future<List<Item>> Function(int page) query;
  // list item builder callback
  final Widget Function(BuildContext, Item) builder;
  // want keep alive
  final bool keepAlive;

  // refresh controller for smart refresher
  final RefreshController controller = RefreshController();

  PagerWidget({Key key, @required this.query, @required this.builder, this.keepAlive}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PagerWidgetState<Item>();
  }
}

class _PagerWidgetState<Item> extends State<PagerWidget<Item>> with AutomaticKeepAliveClientMixin{
  // list loader state
  PagerState _state;

  // list loaded page
  int _page;
  // list items loaded
  List<Item> _items;

  Future<void> _initPage() async {
    if(!this.mounted)
      return;
    try{
      // set page to first page
      this._page = 1;

      // change to loading
      setState(() {
        this._state = PagerState.loading();
      });

      // query first page
      if(this.widget.query != null){
        List<Item> items = await this.widget.query(this._page);
        this._items = items??[];
      }

      // change to loaded
      setState(() {
        this._state = PagerState.loaded();
      });

    } catch(e) {
      // query first page failed
      setState(() {
        this._state = PagerState.failed(e.toString());
      });
    }
  }

  Future<void> _loadFirstPage() async {
    if(!this.mounted)
      return;
    // set page to first page
    this._page = 1;
    // query page data
    if(this.widget.query != null){
      List<Item> items = await this.widget.query(this._page);
      this._items = items??[];
    }

    // no page data
    if(this._items.length==0){
      throw NoMorePage();
    } else {
      setState(() {});
    }
  }

  Future<void> _loadNextPage() async {
    if(!this.mounted)
      return;
    // add page
    this._page = this._page==null ? 1 : this._page+1;
    // query page data
    if(this.widget.query != null){
      List<Item> items = await this.widget.query(this._page);
      if((items?.length??0) == 0){
        this._page = this._page - 1;
        throw NoMorePage();
      } else {
        setState(() {
          this._items.addAll(items);
        });
      }
    }
  }

  Future<void> _onLoadPage(bool up) async {
    try {
      if (up) {
        await this._loadFirstPage();
        this.widget.controller.sendBack(up, RefreshStatus.completed);
        this.widget.controller.sendBack(!up, RefreshStatus.idle);
      } else {
        await this._loadNextPage();
        this.widget.controller.sendBack(up, RefreshStatus.idle);
        this.widget.controller.sendBack(!up, RefreshStatus.completed);
      }
    } on NoMorePage {
      this.widget.controller.sendBack(up, RefreshStatus.completed);
    } catch (e) {
      this.widget.controller.sendBack(up, RefreshStatus.failed);
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      this._initPage();
    });
  }

  @override
  bool get wantKeepAlive => this.widget.keepAlive??false;

  @override
  Widget build(BuildContext context) {
    if (this._state?.status == PagerStatus.loaded) {
      //list has loaded
      return SmartRefresher(
        controller: this.widget.controller,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: this._onLoadPage,
        headerBuilder: (context, mode) => _PagerHeaderWidget(mode: mode),
        footerBuilder: (context, mode) => _PagerFooterWidget(mode: mode),
        child: ListView.builder(
          itemCount: this._items?.length??0,
          itemBuilder: (context, index){
            return this.widget.builder(context, this._items[index]);
          },
        ),
      );
    } else if(this._state?.status == PagerStatus.loading) {
      // loading list
      return LoadingIndicator();
    } else {
      // query list failed
      return FailureIndicator(msg: this._state?.msg, retry: this._initPage);
    }
  }
}

class _PagerHeaderWidget extends StatelessWidget {
  final int mode;
  _PagerHeaderWidget({Key key, @required this.mode}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClassicIndicator(
      mode: this.mode,
      noDataText: '没有数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }
}

class _PagerFooterWidget extends StatelessWidget {
  final int mode;
  _PagerFooterWidget({Key key, @required this.mode}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有数据',
      releaseText: '松开加载数据',
      refreshingText: '数据加载中...',
      completeText: '加载完成',
      failedText: '加载数据失败',
      idleText: '上拉加载',
    );
  }
}