import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../redux/state.dart';
import '../../redux/action.dart';

import 'search.dart';
import 'widget/index.dart';
import 'widget/stock.dart';


class MarketHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateApp, StateMainIndexes>(
      onInit: (store) {
        store.dispatch(ActionLoadMainIndexes);
      },
      converter: (store) {
        return store.state.indexes.mainIndexes;
      },
      builder: (context, status) {
        return Scaffold(
          appBar: AppBar(
            title: StockSearchButton(),
          ),
          body: Column(
            children: <Widget>[
              MainIndexesWidget(),
              OptionalStockWidget()
            ],
          ),
        );
      },
    );
  }
}


class MarketHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MainIndexesWidget(),
        OptionalStockWidget()
      ],
    );
  }
}
