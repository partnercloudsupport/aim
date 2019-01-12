import 'package:flutter/material.dart';
import '../common.dart';
import '../scaffold_page.dart';


class MarketQuotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'market',
      child: Column(
        children: <Widget>[
          _IndexesQuoteWidget(),
          _SearchStockButton(),
          Expanded(
            child: _StockListWidget()
          )
        ],
      )
    );
  }
}


class _StockListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: double.infinity,
      //width: double.infinity,
      child: Column(
        children: <Widget>[
          _StockListTitleWidget(),
          Expanded(
           child: _StockListBodyWidget(),
          )
        ],
      ),
    );
  }
}


class _StockListBodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: double.infinity,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: _StockListItemWidget(),
          );
        },
      ),
    );
  }
}

class _StockListTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '股票名称',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '最新价',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '涨跌幅',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '今开价',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '昨收价',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class _StockListItemNameWidget extends StatelessWidget {
  final String name;
  final String code;

  _StockListItemNameWidget({Key key, @required this.name, @required this.code}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                this.name,
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
                this.code,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[400]
                ),
              )
          ),
        )
      ],
    );
  }
}

class _StockListItemNumWidget extends StatelessWidget {
  final dynamic num;
  final int change;

  _StockListItemNumWidget({Key key, @required this.num, @required this.change}):super(key:key);

  Color _textColor() {
    if (change>0) {
      return Colors.red[600];
    } else if(change<0) {
      return Colors.green[600];
    } else {
      return Colors.grey[600];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        this.num.toString(),
        style: TextStyle(
          color: this._textColor(),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StockListItemWidget extends StatelessWidget {
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
                                    '中国平安',
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
                                    '600138',
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
                              '23.00',
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
                              '+2.30%',
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
                              '23.00',
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
                              '23.00',
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

class _SearchStockButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: FlatButton.icon(
        color: Colors.grey[200],
        icon: Icon(Icons.search),
        label: Container(
          alignment: Alignment.center,
          child: Text('搜索股票，股票代码或者名称'),
        ),
        onPressed: () {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('pressed')));
        },
      ),
    );
  }
}


class _IndexesQuoteWidget extends StatelessWidget {
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
    );
  }
}

class _IndexQuoteWidget extends StatelessWidget {
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

