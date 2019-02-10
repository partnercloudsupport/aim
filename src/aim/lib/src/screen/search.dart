import 'package:flutter/material.dart';
import 'widget/search.dart';

import 'stock.dart';
import '../routes.dart';
import '../model/stock.dart';

class StockSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: SearchInputWidget(onChanged: (text){},),
      ),
      body: SearchHomeWidget(
        history: List.filled(10, ModelStock.initWith(zqdm: '000001', zqmc: '中国平安')),
        hottest: List.filled(10, ModelStock.initWith(zqdm: '000001', zqmc: '中国平安')),
        onTap: (stock){
          AimNav.push(context, StockPage(stock: stock));
        },
      )
    );
  }
}