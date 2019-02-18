import 'package:flutter/material.dart';
import 'stock.dart';
import 'widget/search.dart';
import 'container/search.dart';
import '../app.dart';
import '../action/search.dart';

class SearchStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: SearchInputWidget(onChanged: (text){
          App.dispatch(context, ActionGetSearchResults(words: text));
        },),
      ),
      body: SearchResultsContainer(
        onTapStock: (stock){
          App.push(context, StockDetailPage(id: stock.id, name: stock.name));
        },
      )
    );
  }
}
