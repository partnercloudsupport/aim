import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../format.dart';

import 'basics.dart';


class MainIndexesQuoteWidget extends StatelessWidget {
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
                child: IndexQuoteWidget(),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(),
              ),
              Expanded(
                flex: 1,
                child: IndexQuoteWidget(),
              )
            ],
          ),
        )
    );
  }
}


class IndexQuoteWidget extends StatelessWidget {
  final String name;
  final double value;
  final double change;
  final double percent;

  IndexQuoteWidget({Key key, this.name, this.value, this.change, this.percent}): super(key:key);

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
                  this.name!=null ? this.name : '--',
                  style: AimTheme.text.stockName,
                )
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  StringFormat.quote(this.value),
                  style: AimTheme.text.stockName,
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
                            StringFormat.price(this.change),
                            style: AimTheme.text.smallRegular.copyWith(color: ColorFormat.price(this.change)),
                          )
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            StringFormat.percent(this.percent),
                            style: AimTheme.text.smallRegular.copyWith(color: ColorFormat.price(this.change)),
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