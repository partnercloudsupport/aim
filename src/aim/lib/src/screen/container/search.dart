import 'package:flutter/material.dart';
import 'app.dart';
import '../../app.dart';
import '../model/search.dart';
import '../widget/search.dart';
import '../../model/stock.dart';
import '../../state/search.dart';
import '../../action/user.dart';
import '../../action/search.dart';


class SearchResultsContainer extends StatelessWidget {
  final void Function(ModelStock) onTapStock;
  SearchResultsContainer({Key key, this.onTapStock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewContainer<SearchResultsModel>(
      select: (store) {
        return SearchResultsModel.fromAppState(store.state);
      },
      dispose: (store) {
        store.dispatch(ActionClearSearchResults());
      },
      builder: (context, model) {
        if((model?.words??'') != ''){
          return SearchResultsWidget(
            words: model?.words,
            results: model?.results,
            collected: model?.collected,
            onTapStock: this.onTapStock,
            onCollectStock: (stock) {
              App.dispatch(context, ActionUserCollectStock(id: stock?.id));
            },
          );
        } else{
          return Column(
            children: <Widget>[
              SearchHistoryContainer(
                  onTapStock: this.onTapStock
              ),
              SearchHottestContainer(
                  onTapStock: this.onTapStock
              )
            ],
          );
        }

      },
    );
  }
}

class SearchHistoryContainer extends StatelessWidget {
  final Function(ModelStock) onTapStock;
  SearchHistoryContainer({Key key, this.onTapStock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewContainer<SearchHistoryModel>(
      init: (store) {
        store.dispatch(ActionGetSearchHistory());
      },
      select: (store) {
        return SearchHistoryModel.fromAppState(store.state);
      },
      builder: (context, model){
        return SearchHistoryWidget(
          stocks: model.stocks,
          onTapStock: this.onTapStock,
        );
      },
    );
  }
}

class SearchHottestContainer extends StatelessWidget {
  final Function(ModelStock) onTapStock;
  SearchHottestContainer({Key key, this.onTapStock}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewContainer<SearchHottestModel>(
      init: (store) {
        store.dispatch(ActionGetSearchHottest());
      },
      select: (store) {
        return SearchHottestModel.fromAppState(store.state);
      },
      builder: (context, model){
        return SearchHottestWidget(
          stocks: model.stocks,
          onTapStock: this.onTapStock,
        );
      },
    );
  }
}


