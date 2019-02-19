import 'package:flutter/material.dart';
import 'app.dart';
import '../model/user.dart';
import '../widget/user.dart';
import '../../model/stock.dart';
import '../../action/user.dart';

class UserStocksContainer extends StatelessWidget {
  final Function() onAdd;
  final Function(ModelStock) onTap;
  UserStocksContainer({Key key, @required this.onAdd, @required this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewContainer<UserStocksViewModel>(
      init: (store) {
        store.dispatch( ActionGetUserStocks());
      },
      select: (store) {
        return UserStocksViewModel.fromAppState(store.state);
      },
      builder: (context, model) {
        return UserStocksWidget(
          stocks: model?.stocks,
          onAdd: this.onAdd,
          onTap: this.onTap,
        );
      },
    );
  }
}
