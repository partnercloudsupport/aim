import 'package:flutter/material.dart';

import 'news/tab.dart';

class NewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 10,
      initialIndex: 0,
      child: NewsTabWidget(),
    );
  }
}
