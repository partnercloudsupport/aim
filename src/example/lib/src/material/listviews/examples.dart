import 'package:flutter/material.dart';
import '../../common.dart';

import 'vertical.dart';
import 'horizontal.dart';
import 'listtile.dart';
import 'mixture_items.dart';
import 'listview.dart';

class ListViewExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('vertical', VerticalListViewExample()),
    Example('horizontal', HorizontalListViewExamples()),
    Example('list tile', ListTileExample()),
    Example('mixture items', MixtureItemsExample()),
    Example('list view', ListViewExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Examples'),
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