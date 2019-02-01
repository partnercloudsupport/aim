import 'package:flutter/material.dart';
import '../common.dart';
import 'textfield.dart';
import 'page_datatable.dart';
import 'scaffold.dart';
import 'card.dart';
import 'container.dart';
import 'animations/examples.dart';
import 'layouts/examples.dart';
import 'buttons/examples.dart';
import 'images/examples.dart';
import 'listviews/examples.dart';
import 'persistence/examples.dart';
import 'networks/examples.dart';
import 'dialogs/examples.dart';
import 'indicator/examples.dart';
import 'slivers/examples.dart';

class MaterialExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Container', ContainerExamplePage()),
    Example('Card', CardExamplePage()),
    Example('Scaffold', ScaffoldPage()),
    Example('TextField', TextFieldPage()),
    Example('PagedDataTable', PagedDataTableExample()),
    Example('Animations', AnimationExamples()),
    Example('Layouts', LayoutExamples()),
    Example('Buttons', ButtonExamples()),
    Example('Images', ImageExamples()),
    Example('ListViews', ListViewExamples()),
    Example('Persistence', PersistenceExamples()),
    Example('Networks', NetworkExamples()),
    Example('Dialogs', DialogExamples()),
    Example('Indicators', IndicatorExamples()),
    Example('Slivers', SliverExamples()),
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
