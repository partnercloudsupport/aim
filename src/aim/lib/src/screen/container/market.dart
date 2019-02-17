import 'package:flutter/material.dart';
import 'app.dart';
import '../stock.dart';
import '../model/market.dart';
import '../widget/index.dart';
import '../widget/stock.dart';
import '../../routes.dart';
import '../../model/stock.dart';
import '../../action/pages.dart';

class MarketContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewContainer<MarketViewModel>(
      action: ActionLoadMarketPage(),
      select: MarketViewModel.fromAppState,
      builder: (context, model) {
        return Column(
          children: <Widget>[
            MainIndexesWidget(
              indexes: model.mainIndexes,
              onTap: (index) {
                // go to index detail page
              },
            ),
            UserStocksWidget(
              stocks: model.userStocks,
              onAdd: () {
                // go to search page
                AppNav.push(context, AppRoutes.searchStock);
              },
              onTap: (stock) {
                // go to stock detail page
                AppNav.push(context, StockDetailPage(id: stock.id, name: stock.name));
              },
            )
          ],
        );
      },
    );
  }
}

class UserStocksWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  final Function() onAdd;
  final Function(ModelStock) onTap;
  UserStocksWidget({Key key, this.stocks, this.onAdd, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    if(this.stocks?.length??0 > 0){
      return StockListWidget(
        stocks: this.stocks,
        onTap: this.onTap,
      );
    } else {
     return EmptyUserStocksWidget(
       onAdd: this.onAdd,
     );
    }
  }
}

class EmptyUserStocksWidget extends StatelessWidget {
  final void Function() onAdd;
  EmptyUserStocksWidget({Key key, @required this.onAdd}): super(key: key);

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