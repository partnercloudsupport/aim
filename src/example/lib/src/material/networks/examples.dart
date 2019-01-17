import 'package:flutter/material.dart';
import '../../common.dart';
import 'offline.dart';
import 'connectivity.dart';

class NetworkExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Online/Offline', OfflineExample()),
    Example('Connectivity', ConnectivityExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Examples'),
      ),
      body: ListView.builder(
        itemCount: _examples.length,
        itemBuilder: (context, index) {
          return RaisedButton(
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>_examples[index].widget));
            },
            child: Text(_examples[index].name),
            padding: EdgeInsets.all(4.0),
          );
        },
      ),
    );
  }
}