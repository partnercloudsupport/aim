import 'dart:async';

import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../model.dart';
import '../state.dart';
import '../action.dart';
import '../../scaffold_page.dart';


class TimerRefreshExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'timer refresh',
      child: StockQuote(),
    );
  }
}


class StockQuote extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StockQuoteState();
  }
}

class StockQuoteState extends State<StockQuote> {
  Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    if(timer == null){
      timer = Timer.periodic(Duration(seconds: 3), (timer){
        StoreProvider.of<AppState>(context).dispatch(ActionLoadStockQuote(type: Action.todo));
        print('request');
      });
    }
    return StoreConnector<AppState, ProtocolStockQuote>(
      converter: (store) {
        if(store.state.quote==null){
          store.dispatch(ActionLoadStockQuote(type: Action.todo));
        }
        return store.state.quote;
      },
      builder: (context, quote) {
        return Container(
          child: _StockListItem(quote: ModelQuote(
              name: '浦发银行',
              code: '000001',
              dqj: quote?.dqj,
              jkj: quote?.jkj,
              zsj: quote?.zsj,
              zdf: '--'
          )),
        );
      },
    );
  }
}

class _StockListItem extends StatelessWidget {
  ModelQuote quote;

  _StockListItem({this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          title: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    quote.name!=null ? quote.name : '--',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    quote.code!=null ? quote.code : '--',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400]
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              quote.dqj!=null ? quote.dqj : '--',
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              quote.zdf!=null ? quote.zdf : '--',
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              quote.jkj!=null ? quote.jkj : '--',
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              quote.zsj!=null ? quote.zsj : '--',
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                      ),
                    ],
                  )
              ),
              Divider(
                height: 10,
                color: Colors.grey[400],
              )
            ],
          ),
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('tabbed')));
          },
          onLongPress: (){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('long pressed')));
          }
      ),
    );
  }
}
