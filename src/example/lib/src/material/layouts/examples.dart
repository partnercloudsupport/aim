import 'package:flutter/material.dart';
import '../../common.dart';
import 'flow.dart';
import 'stack.dart';
import 'stack1.dart';
import 'index_stack.dart';
import 'index_stack1.dart';
import 'index_stack2.dart';


class LayoutExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Flow', FlowExample()),
    Example('Stack', StackExample()),
    Example('Stack1', StackExample1()),
    Example('Index Stack', IndexStackExample()),
    Example('Index Stack1', IndexStackExample1()),
    Example('Index Stack2', IndexStackExample2()),
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
