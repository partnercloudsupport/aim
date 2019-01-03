import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class ButtonExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Button',
      child: Builder(
        builder: (context){
          return FlatButton(
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('clicked')));
              },
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text('click'),
                ),
              )
          );
        },
      )
    );
  }
}