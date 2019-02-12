import 'package:flutter/material.dart';

import '../model/stock.dart';
import '../state/app.dart';
import '../state/stock.dart';
import '../action/stock.dart';
import '../widget/webview.dart';

import 'widget/loader.dart';

class StockPage extends StatelessWidget {
  final String zqdm;
  StockPage({Key key, @required this.zqdm}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReduxLoader(
      action: ActionGetStockDetail(zqdm: this.zqdm),
      selector: Selector.stock,
      builder: (context, state) {
        return _StockPage(stock: state.detail);
      },
    );
  }
}

class _StockPage extends StatelessWidget {
  final ModelStock stock;
  _StockPage({Key key, @required this.stock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: Text(this.stock?.zqmc??'--'),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            child: WebView(
              url: this.stock?.url,
              scriptSrc: this.stock?.tidyjs
            ),
          ),
          _StockPageActions(
            stock: this.stock,
            actionBuy: null,
            actionSell: null,
            actionAddSelected: null
          )
        ],
      ),
    );
  }
}

class _StockPageActions extends StatelessWidget {
  final ModelStock stock;
  final void Function(String code) actionBuy;
  final void Function(String code) actionSell;
  final void Function(String code, String name) actionAddSelected;

  _StockPageActions({Key key, @required this.stock, @required this.actionBuy, @required this.actionSell, @required this.actionAddSelected}): super(key :key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.shopping_cart),
            label: Text('买入'),
            onPressed: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.remove_shopping_cart),
            label: Text('卖出'),
            onPressed: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('自选'),
            onPressed: null,
          ),
        )
      ],
    );
  }
}