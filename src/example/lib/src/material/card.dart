import 'package:flutter/material.dart';
import '../scaffold_page.dart';


class CardExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'card',
      child: CardExampleWidget(),
    );
  }
}


class CardExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      child: Container(
        height: 100.0,
        width: 100.0,
//        alignment: Alignment.center,
        child: Card(
          color: Colors.blue,
          shape: Border.all(color: Colors.red),
          child: Container(
            alignment: Alignment.center,
            child: Text('card'),
          ),
        ),
      )
    );
  }
}