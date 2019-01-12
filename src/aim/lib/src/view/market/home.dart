import 'package:flutter/material.dart';
import 'package:aim/src/view/market/widget/index.dart';
import 'search.dart';

class MarketHomePage extends StatelessWidget {
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
