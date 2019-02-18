import 'package:flutter/material.dart';
import 'index.dart';
import 'stock.dart';
import 'container/user.dart';
import 'container/index.dart';
import '../app.dart';
import '../routes.dart';

class MarketHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('行情'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              App.push(context, Routes.searchStock);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          MainIndexesContainer(
            onTap: (index) {
              // go to index detail page
              App.push(context, IndexDetailPage(id: index.id, name: index.name));
            },
          ),
          Expanded(
            child: UserStocksContainer(
              onAdd: () {
                // go to search page
                App.push(context, Routes.searchStock);
              },
              onTap: (stock) {
                // go to stock detail page
                App.push(context, StockDetailPage(id: stock.id, name: stock.name));
              },
            ),
          )
        ],
      )
    );
  }
}
