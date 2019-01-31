import 'package:flutter/material.dart';
import '../../common.dart';

class SliverExamples extends StatelessWidget {
  List<Example> _examples = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver Examples'),
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