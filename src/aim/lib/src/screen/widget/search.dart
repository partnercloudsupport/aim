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
      child:TextField(
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

class SearchResultsWidget extends StatelessWidget {
  final String words;
  final List<ModelStock> results;
  final List<String> collected;
  final void Function(ModelStock) onTapStock;
  final void Function(ModelStock) onCollectStock;

  SearchResultsWidget({Key key, this.words, this.results, this.collected, this.onTapStock, this.onCollectStock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if((this.results?.length??0) > 0) {
      return ListView.builder(
        itemCount: this.results?.length??0,
        itemBuilder: (context, index) {
          var stock = this.results?.elementAt(index);
          return SearchResultItemWidget(
            stock: stock,
            collected: this.collected?.contains(stock?.id) ?? false,
            onTap: this.onTapStock,
            onCollect: this.onCollectStock,
          );
        },
      );
    } else{
      return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        alignment: Alignment.topCenter,
        child: Text(
          '没有找到相关股票'
        ),
      );
    }
  }
}

class SearchResultItemWidget extends StatelessWidget {
  final bool collected;
  final ModelStock stock;
  final Function(ModelStock) onTap;
  final Function(ModelStock) onCollect;
  SearchResultItemWidget({Key key, @required this.stock, @required this.collected, this.onTap, this.onCollect}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: (){
                  if(this.onTap != null){
                    this.onTap(this.stock);
                  }
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 85.0,
                      child: Text(
                          this.stock?.name??'--'
                      ),
                    ),
                    Container(
                      child: Text(
                        this.stock?.id??'--',
                        style: AppTheme.text.stockCode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16.0),
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed: (){
                  if(this.onCollect != null) {
                    this.onCollect(this.stock);
                  }
                },
                child: Text(
                    this.collected ? '-自选' : '+自选'
                ),
              ),
            ),
          ],
        ),
        Divider(height: 0.0)
      ],
    );
  }
}

class SearchHottestWidget extends StatelessWidget {
  final int rowItemCount = 4;
  final int maxDisplayCount = 8;

  final List<ModelStock> stocks;
  final void Function(ModelStock) onTapStock;

  SearchHottestWidget({Key key, @required this.stocks, this.onTapStock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.background,
      width: double.infinity,
      //height: 168.0,
      margin: EdgeInsets.only(top: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: 24.0,
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              '热门股票',
              style: AppTheme.text.mediumRegular.copyWith(color: Colors.grey),
            ),
          ),
          Divider(),
          Container(
            height: 128.0,
            child: GridView.count(
              primary: true,
              crossAxisCount: this.rowItemCount,
              childAspectRatio: 1.6,
              children: this.stocks?.map((stock){
                return StockItemWidget(stock: stock, onTap: this.onTapStock);
              })?.take(this.maxDisplayCount)?.toList()??[],
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
  final void Function(ModelStock) onTapStock;

  SearchHistoryWidget({Key key, @required this.stocks, this.onTapStock});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colors.background,
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
              '搜索历史',
              style: AppTheme.text.mediumRegular.copyWith(color: Colors.grey),
            ),
          ),
          Divider(),
          Container(
            height: 128.0,
            child: GridView.count(
              primary: true,
              crossAxisCount: this.rowItemCount,
              childAspectRatio: 1.6,
              children: this.stocks?.map((stock){
                return StockItemWidget(stock: stock, onTap: this.onTapStock,);
              })?.take(this.maxDisplayCount)?.toList()??[],
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
          Center(
            child: Text(
              this.stock?.zqmc??'--',
              style: AppTheme.text.stockName,
            ),
          ),
          Center(
              child: Text(
                this.stock?.zqdm??'--',
                style: AppTheme.text.stockCode,
              )
          ),
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