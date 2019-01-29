import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../state/app.dart';
import '../state/index.dart';
import '../action/market.dart';
import '../widget/index.dart';
import '../widget/stock.dart';
import '../widget/loader.dart';
import '../widget.dart';
import '../routes.dart';

import '../logger.dart';

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Log.info('build market page');
    return StoreConnector<AppState, StateMainIndexes>(
      onInit: (store) {
        Log.info('init market page');
        if (!store.state.indexes.mainIndexes.state.isLoaded) {
          store.dispatch(ActionLoadMainIndexes());
        }
      },
      onDidChange: (mainIndexes){
        Log.info('did change market page');
      },
      onDispose: (store){
        Log.info('dispose market page');
      },
      onInitialBuild: (mainIndexes){
        Log.info('init build market page');
      },
      onWillChange: (mainIndexes){
        Log.info('on will change market page');
      },
      converter: (store) {
        return store.state.indexes.mainIndexes;
      },
      builder: (context, mainIndexes) {
        Log.info('on builder market page');
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

