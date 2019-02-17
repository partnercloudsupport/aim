import 'package:flutter/material.dart';
import 'webview.dart';
import '../../theme.dart';
import '../../model/stock.dart';

class StockListWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  final void Function(ModelStock) onTap;

  StockListWidget({Key key, @required this.stocks, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StockListTitleWidget(),
        Expanded(
          child: StockListBodyWidget(stocks: this.stocks, onTap: this.onTap),
        )
      ]
    );
  }
}

class StockListTitleWidget extends StatelessWidget {
  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        style: AppTheme.text.listTitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: double.infinity,
      alignment: Alignment.topCenter,
      color: AppTheme.colors.background,
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

class StockListBodyWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  final void Function(ModelStock) onTap;
  StockListBodyWidget({Key key, this.stocks, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.stocks?.length??0,
      itemBuilder: (context, index) {
        return StockListItemWidget(
          stock: this.stocks?.elementAt(index),
          onTap: this.onTap
        );
      }
    );
  }
}

class StockListItemWidget extends StatelessWidget {
  final ModelStock stock;
  final void Function(ModelStock) onTap;
  StockListItemWidget({Key key, @required this.stock, this.onTap}): super(key: key);

  Color _quoteColor() {
    return AppTheme.colors.price(this.stock?.quote?.zde);
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
                  style: AppTheme.text.stockName,
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
                  style: AppTheme.text.stockCode,
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
        style: AppTheme.text.stockQuote.copyWith(color: this._quoteColor()),
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
        if(this.onTap != null){
          this.onTap(this.stock);
        }
      },
    );
  }
}

class StockDetailWidget extends StatelessWidget {
  final ModelStockDetail stock;
  final void Function(ModelStockDetail) buy;
  final void Function(ModelStockDetail) sell;
  final void Function(ModelStockDetail) collect;

  StockDetailWidget({Key key, @required this.stock, @required this.buy, @required this.sell, @required this.collect}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: WebView(
              url: this.stock?.url,
              scriptSrc: this.stock?.tidyjs
          ),
        ),
        StockActionWidget(
            stock: this.stock,
            buy: null,
            sell: null,
            collect: null
        )
      ],
    );
  }
}

class StockActionWidget extends StatelessWidget {
  final ModelStockDetail stock;
  final void Function(ModelStockDetail) buy;
  final void Function(ModelStockDetail) sell;
  final void Function(ModelStockDetail) collect;

  StockActionWidget({Key key, @required this.stock, @required this.buy, @required this.sell, @required this.collect}): super(key :key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.shopping_cart),
            label: Text('买入'),
            onPressed: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.remove_shopping_cart),
            label: Text('卖出'),
            onPressed: null,
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton.icon(
            icon: Icon(Icons.add),
            label: Text('自选'),
            onPressed: null,
          ),
        )
      ],
    );
  }
}
