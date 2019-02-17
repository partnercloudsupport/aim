import 'package:flutter/material.dart';
import '../routes.dart';
import 'container/market.dart';

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
              AppNav.push(context, AppRoutes.searchStock);
            },
          )
        ],
      ),
      body: MarketContainer()
    );
  }
}
