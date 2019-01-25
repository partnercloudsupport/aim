import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'indicator.dart';

////// loader status ///////
// loader status
enum LoaderStatus {loading, loaded, failed }
// loader state
class LoaderState {
  LoaderStatus status;
  String msg;
  dynamic data;

  LoaderState({@required this.status, this.msg, this.data});

  factory LoaderState.loading() => LoaderState(status: LoaderStatus.loading);
  factory LoaderState.loaded([dynamic data]) => LoaderState(status: LoaderStatus.loaded, data: data);
  factory LoaderState.failed(String msg) => LoaderState(status: LoaderStatus.failed, msg: msg);
}


/////////////// widget loader ////////////////
// widget load action
typedef OnWidgetLoad<LoadResult> = Future<LoadResult> Function();

// widget load action result converter
typedef WidgetLoadedConverter<LoadResult, ViewModel> = ViewModel Function(LoadResult);
// widget loaded builder
typedef WidgetLoadedBuilder<ViewModel> = Widget Function(BuildContext, ViewModel);
// widget loading builder
typedef WidgetLoadingBuilder = Widget Function(BuildContext context);
// widget load failed builder
typedef WidgetFailedBuilder = Widget Function(BuildContext context, String failure, OnWidgetLoad reload);


// widget loader widget
class WidgetLoader<LoadResult, ViewModel> extends StatefulWidget {
  // loader action
  final OnWidgetLoad load;
  // loader converter
  final WidgetLoadedConverter<LoadResult, ViewModel> converter;
  // succeed child builder
  final WidgetLoadedBuilder<ViewModel> builder;
  // loading child builder
  final WidgetLoadingBuilder loading;
  // failure widget builder
  final WidgetFailedBuilder failed;

  WidgetLoader({Key key, @required this.load, this.converter, @required this.builder, this.loading, this.failed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WidgetLoaderState<LoadResult, ViewModel>();
  }
}

// loader widget
class _WidgetLoaderState<LoadResult, ViewModel> extends State<WidgetLoader<LoadResult, ViewModel>> {
  // load state
  LoaderState state;

  @override
  void initState() {
    super.initState();
    this.load();
  }

  // load action
  Future<void> load() async {
    try {
      // update state to loading
      setState(() {
        this.state = LoaderState.loading();
      });

      // load action
      LoadResult result = await this.widget.load();
      // convert result
      ViewModel data = this.widget.converter==null ? result : this.widget.converter(result);

      // update state to loaded
      setState(() {
        this.state = LoaderState.loaded(data);
      });
    } catch (e) {
      // load failed
      setState(() {
        this.state = LoaderState.failed(e.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch(this.state.status){
      case LoaderStatus.loading:
        child = this.widget.loading==null ? LoadingIndicator() : this.widget.loading(context);
        break;
      case LoaderStatus.failed:
        child = this.widget.failed==null ? FailureIndicator(msg: this.state.msg, retry: this.load) : this.widget.failed(context, this.state.msg, this.load);
        break;
      case LoaderStatus.loaded:
        child = this.widget.builder(context, state.data);
        break;
    }
    return child;
  }
}

/////////////// page loader with pull/push refresh////////////////
// page load action callback
typedef OnPageLoad<LoadResult> = Future<LoadResult> Function();

// page loaded data converter
typedef PageLoadedConverter<LoadResult, ViewModel> = ViewModel Function(LoadResult);
// page loaded widget builder
typedef PageLoadedBuilder<LoadResult> = Widget Function(BuildContext, LoadResult);
// widget loading builder
typedef PageLoadingBuilder = Widget Function(BuildContext context);
// widget load failed builder
typedef PageFailedBuilder = Widget Function(BuildContext context, String failure, OnPageLoad reload);


/// page loader widget
class PageLoader<LoadResult, ViewModel> extends StatefulWidget {
  final bool enablePull;
  final bool enablePush;

  final OnPageLoad<LoadResult> load;
  final PageLoadedConverter<LoadResult, ViewModel> converter;
  final PageLoadedBuilder<LoadResult> builder;
  final PageLoadingBuilder loading;
  final PageFailedBuilder failed;

  final RefreshController controller = RefreshController();

  PageLoader({Key key, @required this.load, this.converter, @required this.builder, this.enablePull, this.enablePush, this.loading, this.failed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PageLoaderState<LoadResult, ViewModel>();
  }
}

class _PageLoaderState<LoadResult, ViewModel> extends State<PageLoader<LoadResult, ViewModel>> {
  // page load state
  LoaderState _state;

  Future<void> _onLoad() async {
    try{
      setState(() {
        this._state = LoaderState.loading();
      });

      LoadResult result = await this.widget.load();
      ViewModel data = this.widget.converter==null ? result : this.widget.converter(result);

      setState(() {
        this._state = LoaderState.loaded(data);
      });

    } on Exception catch(e) {
      setState(() {
        this._state = LoaderState.failed(e.toString());
      });
    }
  }

  Future<void> _onRefresh(bool up) async {
    try {
      if (up) {
        await this._onLoad();
        this.widget.controller.sendBack(up, RefreshStatus.completed);
        this.widget.controller.sendBack(!up, RefreshStatus.idle);
      } else {
        await this._onLoad();
        this.widget.controller.sendBack(up, RefreshStatus.idle);
        this.widget.controller.sendBack(!up, RefreshStatus.completed);
      }
    } catch (e) {
      this.widget.controller.sendBack(up, RefreshStatus.failed);
    }
  }

  Widget _buildHeader(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }

  Widget _buildFooter(BuildContext context, int mode) {
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

  @override
  void initState() {
    super.initState();
    this._onLoad();
  }

  @override
  Widget build(BuildContext context) {
    if(this._state?.status == LoaderStatus.loading) {
      return this.widget.loading==null ? LoadingIndicator() : this.widget.loading(context);
    } else if (this._state?.status == LoaderStatus.loaded) {
      return SmartRefresher(
        controller: this.widget.controller,
        enablePullUp: this.widget.enablePush ?? true,
        enablePullDown: this.widget.enablePull ?? false,
        onRefresh: this._onRefresh,
        headerBuilder: _buildHeader,
        footerBuilder: _buildFooter,
        child: this.widget.builder(context, this._state?.data),
      );
    } else {
      return this.widget.failed==null ? FailureIndicator(msg: this._state?.msg, retry: this._onLoad) : this.widget.failed(context, this._state?.msg, this._onLoad);
    }
  }
}


/////////////// list loader ////////////////
// no more page
class NoMorePage implements Exception {}

// scroll load action callback
typedef OnListLoad<Items> = Future<Items> Function(int page);
// list item builder
typedef ListItemBuilder<Item> = Widget Function(BuildContext, Item);
// widget loading builder
typedef ListLoadingBuilder = Widget Function(BuildContext context);
// widget load failed builder
typedef ListFailedBuilder = Widget Function(BuildContext context, String failure, OnPageLoad reload);

/// scroll widget loader
class ListLoader<Item> extends StatefulWidget {
  // page loader callback
  final OnListLoad<List<Item>> load;
  // list item builder callback
  final ListItemBuilder<Item> builder;
  // list first loading builder
  final ListLoadingBuilder loading;
  // list load failed builder
  final ListFailedBuilder failed;

  // refresh controller for smart refresher
  final RefreshController controller = RefreshController();

  ListLoader({Key key, @required this.load, @required this.builder, this.loading, this.failed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListLoaderState<Item>();
  }
}

class _ListLoaderState<Item> extends State<ListLoader<Item>> {
  // list loader state
  LoaderState _state;

  // list loaded page
  int _page;
  // list items loaded
  List<Item> _items;

  void _loadList() async {
    try{
      // set page to first page
      this._page = 1;

      // change to loading
      setState(() {
        this._state = LoaderState.loading();
      });

      // load first page
      if(this.widget.load != null){
        List<Item> items = await this.widget.load(this._page);
        this._items = items??[];
      }

      // change to loaded
      setState(() {
        this._state = LoaderState.loaded();
      });

    } catch(e) {
      // load first page failed
      setState(() {
        this._state = LoaderState.failed(e.toString());
      });
    }
  }

  Future<void> _loadFirstPage() async {
    // set page to first page
    this._page = 1;
    // load page data
    if(this.widget.load != null){
      List<Item> items = await this.widget.load(this._page);
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
    // add page
    this._page = this._page==null ? 1 : this._page+1;
    // load page data
    if(this.widget.load != null){
      List<Item> items = await this.widget.load(this._page);
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

  Future<void> _onRefresh(bool up) async {
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

  Widget _buildHeader(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有数据',
      releaseText: '松开刷新数据',
      refreshingText: '数据刷新中...',
      completeText: '数据刷新完成',
      failedText: '刷新数据失败',
      idleText: '下拉刷新',
    );
  }

  Widget _buildFooter(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      noDataText: '没有数据',
      releaseText: '松开加载数据',
      refreshingText: '数据加载中...',
      completeText: '数据加载完成',
      failedText: '加载数据失败',
      idleText: '上拉加载',
    );
  }

  @override
  void initState() {
    super.initState();
    this._loadList();
  }

  @override
  Widget build(BuildContext context) {
    if (this._state?.status == LoaderStatus.loaded) {
      //list has loaded
      return SmartRefresher(
        controller: this.widget.controller,
        enablePullUp: true,
        enablePullDown: true,
        onRefresh: this._onRefresh,
        headerBuilder: _buildHeader,
        footerBuilder: _buildFooter,
        child: ListView.builder(
          itemCount: this._items?.length??0,
          itemBuilder: (context, index){
            return this.widget.builder(context, this._items[index]);
          },
        ),
      );
    } else if(this._state?.status == LoaderStatus.loading) {
      // loading list
      return this.widget.loading==null ? LoadingIndicator() : this.widget.loading(context);
    } else {
      // load list failed
      return this.widget.failed==null ? FailureIndicator(msg: this._state?.msg, retry: this._loadList) : this.widget.failed(context, this._state?.msg, this._loadList);
    }
  }
}
