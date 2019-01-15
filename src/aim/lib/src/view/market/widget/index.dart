import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../theme.dart';
import '../../../model/index.dart';


class MainIndexesQuoteWidget extends StatelessWidget {
  final List<ModelIndexQuote> indexes;
  MainIndexesQuoteWidget({Key key, this.indexes}): super(key: key);

  // get index at i position in the list
  ModelIndexQuote getIndex(int i) {
    if (indexes == null || i >= indexes.length){
      return null;
    }
    return indexes[i];
  }

  @override
  Widget build(BuildContext context) {
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
              child: IndexQuoteWidget(index: this.getIndex(0)),
            ),
            Expanded(
              flex: 1,
              child: IndexQuoteWidget(index: this.getIndex(1)),
            ),
            Expanded(
              flex: 1,
              child: IndexQuoteWidget(index: this.getIndex(2)),
            )
          ],
        ),
      )
    );
  }
}


class IndexQuoteWidget extends StatelessWidget {
  final ModelIndexQuote index;
  IndexQuoteWidget({Key key, this.index}): super(key:key);

  Color quoteColor() {
    return AimTheme.colors.price(index!=null ? index.zde : null);
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
                  index!=null ? index.getZqmc() : '--',
                  style: AimTheme.text.stockName,
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  index!=null ? index.getDqj() : '--',
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
                          child: Text(
                            index!=null ? index.getZde() : '--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            index!=null ? index.getZdf() : '--',
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