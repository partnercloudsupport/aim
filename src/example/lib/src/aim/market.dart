import 'package:flutter/material.dart';
import '../common.dart';
import '../scaffold_page.dart';

class MarketQuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'market',
      child: Container(
        alignment: Alignment.topCenter,
        width: double.infinity,
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.only(top:5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _IndexQuoteWidget(),
              ),
              Expanded(
                flex: 1,
                child: _IndexQuoteWidget(),
              ),
              Expanded(
                flex: 1,
                child: _IndexQuoteWidget(),
              )
            ],
          ),
        )
      ),
    );
  }
}


class _IndexQuoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 70.0,
      margin: EdgeInsets.all(1.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  '上证指数',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
            ),
            VerticalDivider(
              width: 2.0,
              color: Colors.red,
              //indent: 0.0,
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Text(
                  '2456.23',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.red[600],
                  ),
                ),
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
                          '12.32',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.red[600]
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          '+2.34%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.red[600]
                          ),
                        ),
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

