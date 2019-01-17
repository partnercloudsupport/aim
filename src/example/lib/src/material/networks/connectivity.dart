import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import '../../scaffold_page.dart';


class ConnectivityExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPageWidget(
      title: 'connectivity',
      child: ConnectivityCheckWidget(),
    );
  }
}

class ConnectivityCheckWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ConnectivityCheckWidgetState();
  }
}

class ConnectivityCheckWidgetState extends State<ConnectivityCheckWidget> {
  ConnectivityResult status;

  @override
  void initState() {
    super.initState();
    check();
  }

  void check() {
    Connectivity().checkConnectivity().then((result){
      setState(() {
        status = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Text(status.toString()),
            ),
            Container(
              height: 50,
              child: RaisedButton(
                child: Text('check'),
                onPressed: (){
                  check();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}