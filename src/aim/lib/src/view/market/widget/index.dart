import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../redux/state.dart';
import '../../../redux/action.dart';
import '../../../model/index.dart';

import '../../theme.dart';


class MainIndexesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<StateApp, StateMainIndexes>(
      onInit: (store){

      },
      converter: (store) {
        return store.state.indexes.mainIndexes;
      },
      builder: (context, mainIndexes) {
        return Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.only(top:5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: mainIndexes?.get(0)),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: mainIndexes?.get(1)),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(index: mainIndexes?.get(2)),
              )
            ],
          ),
        )
        );
      }
    );
  }
}


class IndexQuoteWidget extends StatelessWidget {
  final StateMainIndex index;
  IndexQuoteWidget({Key key, this.index}): super(key:key);

  Color quoteColor() {
    return AimTheme.colors.price(index?.quote?.zde);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 70.0,
      color: Colors.grey[100],
      margin: EdgeInsets.all(1.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  this.index?.name??'--',
                  style: AimTheme.text.stockName,
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  this.index?.quote?.strDqj??'--',
                  style: AimTheme.text.stockQuote.copyWith(color: this.quoteColor()),
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.index?.quote?.strZde??'--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.index?.quote?.strZdf??'--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      )
                    ],
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}