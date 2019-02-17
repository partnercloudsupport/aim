import 'package:flutter/material.dart';
import 'container/stock.dart';

class StockDetailPage extends StatelessWidget {
  final String id;
  final String name;
  StockDetailPage({Key key, @required this.id, @required this.name}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        centerTitle: true,
        title: Text(this.name??this.id??'--'),
      ),
      body: StockDetailContainer(id: this.id)
    );
  }
}
