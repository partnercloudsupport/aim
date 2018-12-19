import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../reduxs.dart';

class MineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MineWidgetState();
  }
}


class _MineWidgetState extends State<MineWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    var state = StoreProvider.of<AppState>(context).state;
    print(state);
  }

  @override
  Widget build(BuildContext context) {
    var state = StoreProvider.of<AppState>(context).state;
    print(state);
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
