import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'builder.dart';

import '../../state/app.dart';
import '../../state/stock.dart';
import '../../action/stock.dart';
import '../../widget/webview.dart';

class StockDetailWidget extends StatelessWidget{
  final String zqdm;
  StockDetailWidget({Key key, @required this.zqdm}): super(key: key);

  Widget _buildWebPage(String url){
    return WebviewScaffold(
      url: url??'',
      allowFileURLs: true,
      appCacheEnabled: true,
      clearCache: false,
      clearCookies: false,
      enableAppScheme: true,
      withZoom: true,
      withJavascript: true,
      withLocalStorage: true,
      initialChild: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildWebView(String url) {
    return Container(
      width: double.infinity,
      height: 400,
      alignment: Alignment.center,
      //margin: EdgeInsets.only(top: 10.0),
      child: WebView(url: url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StockDetailState>(
      onInit: (store){
        store.dispatch(ActionGetStockDetail(zqdm: this.zqdm));
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
            //return this._buildWebView(stockDetailState.detailUrl);//_buildWebPage(stockDetailState.detailUrl);
            return Column(
              children: <Widget>[
                Expanded(
                  child: WebView(url: stockDetailState.detailUrl, scriptSrc: stockDetailState.tidyJS),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        child: Text('买入'),
                        onPressed: (){},
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        child: Text('+自选'),
                        onPressed: (){},
                      ),
                    )
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }
}
