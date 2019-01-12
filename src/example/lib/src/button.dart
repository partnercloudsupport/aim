import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class ButtonExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'Button',
      child: Builder(
        builder: (context){
          return Container(
            child: Column(
              children: <Widget>[
                Button0Widget(),
                Button1Widget()
              ],
            ),
          );
        },
      )
    );
  }
}


class Button0Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
          onPressed: (){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('clicked')));
          },
          child: Container(
            width: double.infinity,
            child: Center(
              child: Text('click'),
            ),
          )
      ),
    );
  }
}

class Button1Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(Icons.android),
      label: Container(
        child: Text('icon button'),
      ),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('icon button clicked')));
      },
    );
  }
}