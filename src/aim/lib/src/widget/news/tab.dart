import 'package:flutter/material.dart';

import 'list.dart';

import '../../models.dart' as models;
import '../../remotes.dart' as remotes;


class NewsTabWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsTabWidgetState();
  }
}


class _NewsTabWidgetState extends State<NewsTabWidget> {
  List<models.NewsCategory> _categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    TabController ctlr = DefaultTabController.of(this.context);
    int index = ctlr.index;
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
  void didUpdateWidget(NewsTabWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_categories == null){
      _fetchNewsCategories();
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
        appBar: AppBar(
            title: TabBar(
                isScrollable: true,
                tabs: _categories.map((category) {return Tab(text: category.name);}).toList()
            )
        ),
        body: TabBarView(
            children: _categories.map((category){ return NewsListWidget(category: category);}).toList()
        )
    );
  }

  void _fetchNewsCategories() {
    // get news categories
    remotes.getNewsCategories().then((categories) {
      print('get news categories finsihed.');
      _categories = categories;
      setState(() {});
    }).catchError((error) {
      print('get news categories failed. $error');
    }).whenComplete(() {
      print('get news categories completed.');
    });
  }
}
