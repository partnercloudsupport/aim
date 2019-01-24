import 'package:flutter/material.dart';

import '../model/index.dart';
import '../theme.dart';


class IndexesWidget extends StatelessWidget {
  final List<ModelIndex> indexes;
  IndexesWidget({Key key, @required this.indexes}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        child: Card(
          elevation: 3.0,
          margin: EdgeInsets.only(top: 5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: IndexWidget(index: (this.indexes?.length??0)>0 ? indexes[0] : null),
              ),
              Expanded(
                flex: 1,
                child: IndexWidget(index: (this.indexes?.length??0)>1 ? indexes[1] : null),
              ),
              Expanded(
                flex: 1,
                child: IndexWidget(index: (this.indexes?.length??0)>2 ? indexes[2] : null),
              )
            ],
          ),
        )
    );
  }
}

class IndexWidget extends StatelessWidget {
  final ModelIndex index;
  IndexWidget({Key key, this.index}): super(key:key);

  Color quoteColor() {
    return AimTheme.colors.price(this.index?.zde);
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
                  this.index?.strDqj??'--',
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
                            this.index?.strZde??'--',
                            style: AimTheme.text.stockQuoteSmall.copyWith(color: this.quoteColor()),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            this.index?.strZdf??'--',
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