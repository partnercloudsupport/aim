import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../redux/state.dart';
import '../../redux/action.dart';

import '../widget/loader.dart';

import 'search.dart';
import 'widget/index.dart';
import 'widget/stock.dart';

class MarketHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Status>(
      onInit: (store) {
        store.dispatch(ActionLoadMainIndexes);
      },

      converter: (store) {
        if(store.state.indexes.mainIndexesState.status == null) {
          store.dispatch(ActionLoadMainIndexes());
          return Status.loading;
        }

        return store.state.indexes.mainIndexesState.status;
      },
      builder: (context, status) {
        return Scaffold(
          appBar: AppBar(
            title: StockSearchButton(),
          ),
          body: AsyncLoader(
            loader: () {
              StoreProvider.of(context).dispatch(ActionLoadMainIndexes);
            },
            builder: ,
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
