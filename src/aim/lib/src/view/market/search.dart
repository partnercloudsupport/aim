import 'package:flutter/material.dart';
import '../widgets.dart';


class StockSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      color: Theme.of(context).primaryColorLight,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).primaryColorLight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      icon: Icon(
        Icons.search,
        color: Theme.of(context).primaryIconTheme.color,
      ),
      label: Container(
        height: 30.0,
        width: 250.0,
        alignment: Alignment.center,
        child: Text(
          '搜索股票，股票代码或者名称',
          style: Theme.of(context).primaryTextTheme.button,
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return StockSearchPage();
        }));
      },
    );
  }
}


class StockSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FlatButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}