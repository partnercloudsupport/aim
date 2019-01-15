import 'package:flutter/material.dart';

import 'widget/index.dart';
import 'search.dart';

class MarketHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MarketHomePageState();
  }
}


class MarketHomePageState extends State<MarketHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StockSearchButton(),
      ),
      body: Column(
        children: <Widget>[
          MainIndexesQuoteWidget(),
        ],
      ),
    );
  }
}
