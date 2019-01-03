import 'package:flutter/material.dart';

class Example {
  final String name;
  final Widget widget;
  Example(this.name, this.widget);
}

class ThemePage extends StatelessWidget {
  List<Example> _examples = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Examples'),
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
