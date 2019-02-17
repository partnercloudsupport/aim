import 'package:flutter/material.dart';


class TradeHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TradePageState();
  }
}


class _TradePageState extends State<TradeHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('交易'),
      ),
      body: Center(
        child: Text('trade'),
      ),
    );
  }
}