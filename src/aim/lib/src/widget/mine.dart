import 'package:flutter/material.dart';


class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineWidgetState();
  }
}


class _MineWidgetState extends State<MineWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: Center(
        child: Text('mine'),
      ),
    );
  }
}
