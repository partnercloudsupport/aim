import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/app.dart';
import '../state/index.dart';
import '../action/index.dart';
import '../widget/index.dart';
import '../widget/stock.dart';

import '../widget.dart';
import 'search.dart';

class MarketHomePage extends StatelessWidget {
  MarketHomePage({Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateApp, StateMainIndexes>(
      onInit: (store) {
        if (!store.state.indexes.mainIndexes.state.isLoaded) {
          store.dispatch(ActionLoadMainIndexes());
        }
      },
      converter: (store) {
        return store.state.indexes.mainIndexes;
      },
      builder: (context, mainIndexes) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('行情'),
            actions: <Widget>[
              Icon(Icons.search, size: 28,),
            ],
          ),
          body: StateLoader(
            state: mainIndexes.state,
            builder: (context) {
              return Column(
                children: <Widget>[
                  IndexesWidget(indexes: mainIndexes.indexes),
                  OptionalStockWidget()
                ],
              );
            },
            actionRetry: ActionLoadMainIndexes(),
          ),
        );
      },
    );
  }
}

