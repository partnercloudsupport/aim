import 'package:flutter/material.dart';
import '../common.dart';
import 'listtile.dart';
import 'textfield.dart';
import 'page_datatable.dart';
import 'listview.dart';
import 'scaffold.dart';
import 'card.dart';
import 'container.dart';


class MaterialExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Container', ContainerExamplePage()),
    Example('Card', CardExamplePage()),
    Example('Scaffold', ScaffoldPage()),
    Example('ListTile', ListTilePage()),
    Example('TextField', TextFieldPage()),
    Example('PagedDataTable', PagedDataTableExample()),
    Example('ListView', ListViewExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Examples'),
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