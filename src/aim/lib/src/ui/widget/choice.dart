import 'package:flutter/material.dart';


class SelfChoiceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SelfChoiceState();
  }
}


class _SelfChoiceState extends State<SelfChoiceWidget> {
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