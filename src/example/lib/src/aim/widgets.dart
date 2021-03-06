import 'package:flutter/material.dart';
import '../common.dart';
import 'market.dart';
import 'table.dart';


class AimExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('market', MarketQuotePage()),
    Example('table', TableViewExample())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Examples'),
      ),
      body: ListView.builder(
        itemCount: _examples.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_examples[index].widget));
            },
            child: Text(_examples[index].name),
            padding: EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}