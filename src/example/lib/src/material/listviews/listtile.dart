import 'package:flutter/material.dart';
import '../../scaffold_page.dart';

class ListTileExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'ListTile',
      child: ListView.builder(
        itemBuilder: (context, index){
          return _StockListItem();
        },
      )
    );
  }
}


class _StockListItem extends StatelessWidget {
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
