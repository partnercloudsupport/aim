import 'package:flutter/material.dart';


class MarketPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarketPageState();
  }
}


class _MarketPageState extends State<MarketPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('行情'),
      ),
      body: Center(
        child: Text('market'),
      ),
    );
  }
}