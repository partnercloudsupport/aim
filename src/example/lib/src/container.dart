import 'package:flutter/material.dart';
import 'scaffold_page.dart';

class ContainerExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'container',
      child: Container(
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