import 'package:flutter/material.dart';


class SelfChoicePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelfChoicePageState();
  }
}


class _SelfChoicePageState extends State<SelfChoicePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自选'),
      ),
      body: Center(
        child: Text('stock list'),
      ),
    );
  }
}