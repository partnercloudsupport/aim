import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class PageViewExample extends StatelessWidget {
  final _trackingScrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'pageview',
      child: PageView(
        children: <Widget>[
          ListView(
            controller: _trackingScrollController,
            children: List<Widget>.generate(100, (int i) => Text('page 0 item $i')).toList(),
          ),
          ListView(
            controller: _trackingScrollController,
            children: List<Widget>.generate(200, (int i) => Text('page 1 item $i')).toList(),
          ),
          ListView(
            controller: _trackingScrollController,
            children: List<Widget>.generate(300, (int i) => Text('page 2 item $i')).toList(),
          ),
        ],
      ),
    );
  }
}
