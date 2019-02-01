import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import '../../state/app.dart';
import '../../state/stock.dart';
import '../../action/stock.dart';
import 'builder.dart';

class StockDetailWidget extends StatelessWidget{
  final String zqdm;
  StockDetailWidget({Key key, @required this.zqdm}): super(key: key);

  Widget _buildWebPage(String url){
    return WebviewScaffold(
      url: url??'',
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StockDetailState>(
      onInit: (store){
        if(Selector.stock(store.state).isTodo){
          store.dispatch(ActionGetStockDetail(zqdm: this.zqdm));
        }
      },
      converter: (store){
        return Selector.stock(store.state);
      },
      builder: (context, stockDetailState){
        return StateBuilder(
          state: stockDetailState,
          action: (){
            StoreProvider.of<AppState>(context).dispatch(ActionGetStockDetail(zqdm: this.zqdm));
          },
          builder: (context, stockDetailState){
            return _buildWebPage(stockDetailState.detailUrl);
          },
        );
      },
    );
  }
}
