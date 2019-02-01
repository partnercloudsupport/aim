import 'package:flutter/material.dart';

import '../model/stock.dart';
import 'container/stock.dart';

class StockPage extends StatelessWidget {
  final ModelStock stock;
  StockPage({Key key, @required this.stock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: Text(this.stock.strZqmc),
      ),
      body: StockDetailWidget(zqdm: this.stock.zqdm),
    );
  }
}
