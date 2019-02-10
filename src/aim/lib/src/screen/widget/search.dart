import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../model/stock.dart';

class SearchInputWidget extends StatelessWidget {
  final void Function(String) onChanged;
  SearchInputWidget({Key key, @required this.onChanged}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 280,
      child: TextField(
        autofocus: true,
        maxLength: 16,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black54
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(Icons.search),
          hintText: '输入股票代码/名称/拼音',
          hintStyle: TextStyle(
            fontSize: 16.0,
            color: Colors.grey
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 2.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(style: BorderStyle.none)
          )
        ),
        onChanged: this.onChanged,
      )
    );
  }
}

class SearchResultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class SearchHomeWidget extends StatelessWidget {
  final List<ModelStock> history;
  final List<ModelStock> hottest;
  final void Function(ModelStock) onTap;

  SearchHomeWidget({Key key, @required this.history, @required this.hottest, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchHistoryWidget(stocks: this.history, onTap: this.onTap),
        SearchHottestWidget(stocks: this.hottest, onTap: this.onTap)
      ],
    );
  }
}

class SearchHottestWidget extends StatelessWidget {
  final int rowItemCount = 4;
  final int maxDisplayCount = 8;

  final List<ModelStock> stocks;
  final void Function(ModelStock) onTap;

  SearchHottestWidget({Key key, @required this.stocks, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AimTheme.colors.background,
      width: double.infinity,
      height: 168.0,
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 24.0,
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '热门搜索',
              style: AimTheme.text.mediumRegular.copyWith(color: Colors.grey),
            ),
          ),
          Divider(),
          Container(
            height: 128.0,
            child: GridView.count(
              primary: true,
              crossAxisCount: this.rowItemCount,
              childAspectRatio: 1.6,
              children: stocks.map((stock){return StockItemWidget(stock: stock, onTap: this.onTap);}).take(this.maxDisplayCount).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SearchHistoryWidget extends StatelessWidget {
  final int rowItemCount = 4;
  final int maxDisplayCount = 8;

  final List<ModelStock> stocks;
  final void Function(ModelStock) onTap;

  SearchHistoryWidget({Key key, @required this.stocks, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AimTheme.colors.background,
      width: double.infinity,
      height: 168.0,
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 24.0,
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '历史搜索',
              style: AimTheme.text.mediumRegular.copyWith(color: Colors.grey),
            ),
          ),
          Divider(),
          Container(
            height: 128.0,
            child: GridView.count(
              primary: true,
              crossAxisCount: this.rowItemCount,
              childAspectRatio: 1.6,
              children: stocks.map((stock){return StockItemWidget(stock: stock, onTap: this.onTap,);}).take(this.maxDisplayCount).toList(),
            ),
          )
        ],
      ),
    );
  }
}

class SearchEmptyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Text('没有找到相关结果'),
    );
  }
}

class StockItemWidget extends StatelessWidget {
  final ModelStock stock;
  final void Function(ModelStock) onTap;
  StockItemWidget({Key key, @required this.stock, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
        ),
        margin: EdgeInsets.all(4.0),
        padding: EdgeInsets.all(4.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  this.stock?.strZqmc??'--',
                  style: AimTheme.text.stockName,
                ),
              ),
            ),
            Expanded(
              child: Center(
                  child: Text(
                    this.stock?.strZqdm??'--',
                    style: AimTheme.text.stockCode,
                  )
              ),
            )
          ],
        ),
      ),
      onPressed: (){
        if(this.onTap != null){
          this.onTap(this.stock);
        }
      }
    );
  }
}