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
          print('oninit');
          Future.delayed(Duration(seconds: 3)).then((value){
            store.dispatch(ActionUpdateMainIndexesQuote());
          });
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
                      child: IndexQuoteWidget(index: mainIndexes?.getIndex(0), quote: mainIndexes.getQuote(mainIndexes?.getIndex(0)?.zqdm)),
                    ),
                    Expanded(
                      flex: 1,
                      child: IndexQuoteWidget(index: mainIndexes?.getIndex(1), quote: mainIndexes.getQuote(mainIndexes?.getIndex(1)?.zqdm)),
                    ),
                    Expanded(
                      flex: 1,
                      child: IndexQuoteWidget(index: mainIndexes?.getIndex(2), quote: mainIndexes.getQuote(mainIndexes?.getIndex(2)?.zqdm)),
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
  final ModelIndex index;
  final ModelIndexQuote quote;
  IndexQuoteWidget({Key key, this.index, this.quote}): super(key:key);

  Color quoteColor() {
    return AimTheme.colors.price(this.quote?.zde);
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
                  this.index?.zqmc??'--',
                  style: AimTheme.text.stockName,
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  this.quote?.strDqj??'--',
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
                            this.quote?.strZde??'--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.quote?.strZdf??'--',
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