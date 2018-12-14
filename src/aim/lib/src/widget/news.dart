import 'package:flutter/material.dart';

import 'news/list.dart';

import '../models.dart' as models;
import '../remotes.dart' as remotes;


class NewsWidget extends StatefulWidget {
  int current;
  Widget content;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsWidgetState();
  }
}


class _NewsWidgetState extends State<NewsWidget> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.content == null) {
      _fetchNewsCategories();
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(NewsWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.content == null){
      _fetchNewsCategories();
      return Center(child: CircularProgressIndicator());
    }

    return widget.content;
  }

  void _fetchNewsCategories() {
    // get news categories
    remotes.getNewsCategories().then((categories) {
      print('get news categories finsihed.');
      controller = TabController(length: categories.length, vsync: this, initialIndex: widget.current??0);
      widget.content = _buildContent(categories);
      setState(() {});
    }).catchError((error) {
      print('get news categories failed. $error');
    }).whenComplete(() {
      print('get news categories completed.');
    });
  }

  // build content view with news categories
  Widget _buildContent(List<models.NewsCategory> categories) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          isScrollable: true,
          controller: controller,
          tabs: categories.map((category) {return Tab(text: category.name);}).toList()
        )
      ),
      body: TabBarView(
        controller: controller,
        children: categories.map((category){ return NewsListWidget(category: category);}).toList()
      )
    );
  }

  // build a loading progress indicator
  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  // build a failure message indicator
  Widget _buildFailure() {

  }
}
