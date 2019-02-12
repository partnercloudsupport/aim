import 'package:flutter/material.dart';

import '../../theme.dart';
import '../../model/stock.dart';

class UserStockListTitleWidget extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        style: AimTheme.text.listTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      alignment: Alignment.topCenter,
      color: AimTheme.colors.background,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(child: _buildTitle('股票名称')),
          Expanded(child: _buildTitle('最新价')),
          Expanded(child: _buildTitle('涨跌幅')),
          Expanded(child: _buildTitle('今开价')),
          Expanded(child: _buildTitle('昨收价')),
        ],
      ),
    );
  }
}

class UserStockListWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  final void Function() onAdd;
  final void Function(ModelStock) onTab;
  UserStockListWidget({Key key, this.stocks, this.onAdd, this.onTab}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if((this.stocks?.length??0) == 0){
      return EmptyUserStockListWidget(onAdd: this.onAdd);
    } else {
      return ListView.builder(
        itemCount: this.stocks?.length??0,
        itemBuilder: (context, index) {
          return UserStockListItemWidget(stock: this.stocks?.elementAt(index), onTap: this.onTab);
        },
      );
    }
  }
}

class UserStockListItemWidget extends StatelessWidget {
  final ModelStock stock;
  final void Function(ModelStock) onTap;
  UserStockListItemWidget({Key key, @required this.stock, this.onTap}): super(key: key);

  Color _quoteColor() {
    return AimTheme.colors.price(this.stock?.quote?.zde);
  }

  Widget _buildName() {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  this.stock?.zqmc??'--',
                  style: AimTheme.text.stockName,
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  this.stock?.zqdm??'--',
                  style: AimTheme.text.stockCode,
                )
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQuote(String value) {
    return Center(
      child: Text(
        value??'--',
        style: AimTheme.text.stockQuote.copyWith(color: this._quoteColor()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Row(
        children: <Widget>[
          Expanded(child: this._buildName()),
          Expanded(child: this._buildQuote(this.stock?.quote?.strDqj)),
          Expanded(child: this._buildQuote(this.stock?.quote?.strZdf)),
          Expanded(child: this._buildQuote(this.stock?.quote?.strJkj)),
          Expanded(child: this._buildQuote(this.stock?.quote?.strZsj))
        ],
      ),
      onPressed: (){
        if(this.onTap != null && this.stock != null){
          this.onTap(this.stock);
        }
      },
    );
  }
}

class EmptyUserStockListWidget extends StatelessWidget {
  final void Function() onAdd;
  EmptyUserStockListWidget({Key key, @required this.onAdd}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              border:Border.all(
                  color: Colors.grey,
                  style: BorderStyle.solid
              )
          ),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                    height: 1.8
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.add,
                  size: 44,
                  color: Colors.grey,
                ),
              ),
              Text(
                '添加自选',
                style: TextStyle(
                    height: 1.8,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
        onPressed: (){
          if(this.onAdd != null){
            this.onAdd();
          }
        },
      ),
    );
  }
}