import 'package:flutter/material.dart';
import '../model/stock.dart';

class StocksWidget extends StatelessWidget {
  final List<ModelStock> stocks;
  StocksWidget({Key key, @required this.stocks}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('optional'),
    );
  }
}
