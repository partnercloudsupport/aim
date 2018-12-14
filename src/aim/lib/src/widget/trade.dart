import 'package:flutter/material.dart';


class TradeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TradeWidgetState();
  }
}


class _TradeWidgetState extends State<TradeWidget> {
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