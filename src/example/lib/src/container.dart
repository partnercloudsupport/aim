import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class ContainerExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'container',
      child: Container(
        //color: Colors.blue[200],
        height: 100,
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.red
        ),
        foregroundDecoration: BoxDecoration(
          color: Colors.blue,
          backgroundBlendMode: BlendMode.lighten,
          gradient: LinearGradient(
            colors: [Colors.red, Colors.green],
            stops: [0.5, 1.0]
          ),
        ),
        alignment: Alignment.center,
        child: FlatButton(
          onPressed: (){
            
          },
          child: Text('click me'),
        ),
      ),
    );
  }
}