import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../routes.dart';
import '../state/app.dart';
import '../state/market.dart';
import '../action/market.dart';
import '../widget/index.dart';
import '../widget/stock.dart';
import 'container/builder.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('行情'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.pushNamed(context, AimRoutes.searchStock);
            },
          )
        ],
      ),
      body: StoreConnector<AppState, MarketState>(
        onInit: (store) {
          if (Selector.activeTab(store.state) == AppTab.market && Selector.market(store.state).isTodo) {
            store.dispatch(ActionLoadMarketData());
          }
        },
        converter: (store) {
          return Selector.market(store.state);
        },
        ignoreChange: (state) {
          return Selector.activeTab(state) != AppTab.market;
        },
        onDidChange: (marketState) {
          var store = StoreProvider.of<AppState>(context);
          if (Selector.activeTab(store.state)==AppTab.market && marketState.isTodo){
            store.dispatch(ActionLoadMarketData());
          }
        },
        builder: (context, marketState) {
          return StateBuilder<MarketState>(
            state: marketState,
            action: () {
              StoreProvider.of<AppState>(context).dispatch(ActionLoadMarketData());
            },
            builder: (context, marketState){
              return Column(
                children: <Widget>[
                  IndexesWidget(indexes: marketState.indexes),
                  StocksWidget(stocks: marketState.stocks)
                ],
              );
            },
          );
        },
      )
    );
  }
}

