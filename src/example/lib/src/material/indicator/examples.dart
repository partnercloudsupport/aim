import 'package:flutter/material.dart';
import '../../common.dart';

import 'loading_indicator.dart';
import 'failure_indicator.dart';

class IndicatorExamples extends StatelessWidget {
  final List<Example> _examples = [
    Example('loading', LoadingIndicatorExample()),
    Example('failure', FailureIndicatorExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indicator Examples'),
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