import 'package:flutter/material.dart';


class MarketWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MarketWidgetState();
  }
}


class _MarketWidgetState extends State<MarketWidget> {
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