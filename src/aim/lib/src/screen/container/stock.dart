import 'package:flutter/material.dart';
import 'app.dart';

import '../widget/stock.dart';
import '../../state/market.dart';
import '../../action/stock.dart';


class StockDetailContainer extends StatelessWidget {
  // stock id
  final String id;
  StockDetailContainer({Key key, @required this.id}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataContainer<MarketStockDetail>(
      action: ActionGetStockDetail(id: this.id),
      select: (state) => state.market?.stock,
      builder: (context, model) {
        return StockDetailWidget(
          stock: model.stock,
          buy: (stock) {

          },
          sell: (stock) {

          },
          collect: (stock) {

          },
        );
      },
    );
  }
}
