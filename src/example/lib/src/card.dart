import 'package:flutter/material.dart';
import 'common.dart';
import 'scaffold_page.dart';



class CardExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('normal card', _NormalCard())
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


class _NormalCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'normal',
      child: Container(
        alignment: Alignment.center,
        child: Card(
          color: Colors.red,
          elevation: 10,
          child: Container(
            height: 100.0,
            width: double.infinity,
            child: Center(
              child: Text(
                  'i am a card'
              ),
            )
          )
        ),
      )
    );
  }
}