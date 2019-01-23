import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../redux/state.dart';
import '../../redux/action.dart';
import '../../redux/widget.dart';

import 'search.dart';
import 'widget/index.dart';
import 'widget/stock.dart';

class MarketHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateApp, LState>(
      onInit: (store) {
        if (!store.state.indexes.mainIndexes.state.isLoaded) {
          store.dispatch(ActionLoadMainIndexes());
        }
      },
      converter: (store) {
        return store.state.indexes.mainIndexes.state;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: StockSearchButton(),
          ),
          body: StateLoader(
            state: state,
            builder: (context) {
              return Column(
                children: <Widget>[MainIndexesWidget(), OptionalStockWidget()],
              );
            },
            actionRetry: ActionLoadMainIndexes(),
          ),
        );
      },
    );
  }
}
