import 'package:flutter/material.dart';
import '../model/stock.dart';

class StocksWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  StocksWidget({Key key, @required this.stocks}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('optional'),
    );
  }
}

class StockItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}


class UserStocksTitleWidget extends StatelessWidget {

  Widget _buildTitle(String title) {

  }

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


class StockListItemWidget extends StatelessWidget {
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
          )
      ),
    );
  }
}
