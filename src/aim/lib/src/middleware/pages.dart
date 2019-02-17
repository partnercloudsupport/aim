import 'package:redux/redux.dart';
import '../state/all.dart';
import '../action/user.dart';
import '../action/pages.dart';
import '../action/market.dart';

Future<void> loadMarketPage(Store<AppState> store, ActionLoadMarketPage action, NextDispatcher next) async {
  store.dispatch(ActionGetIndexes());
  store.dispatch(ActionGetStocks());
  store.dispatch(ActionGetUserStocks());
}
