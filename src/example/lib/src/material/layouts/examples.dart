import 'package:flutter/material.dart';
import '../../common.dart';
import 'flow.dart';
import 'stack.dart';
import 'index_stack.dart';


class LayoutExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Flow', FlowExample()),
    Example('Stack', StackExample()),
    Example('Index Stack', IndexStackExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Examples'),
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