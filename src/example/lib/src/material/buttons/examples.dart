import 'package:flutter/material.dart';
import '../../common.dart';
import 'expanded.dart';
import 'icon_button.dart';

class ButtonExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('expanded', ExpandedButtonExample()),
    Example('icon button', IconButtonExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Examples'),
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