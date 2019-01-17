import 'package:flutter/material.dart';
import '../../common.dart';

import 'asset_image.dart';
import 'network_image.dart';
import 'cached_network_image.dart';

class ImageExamples extends StatelessWidget {
  List<Example> _examples = [
    Example('Asset Image', AssetImageExample()),
    Example('Network Image', NetWorkImageExample()),
    Example('Cached Network Image', CachedNetWorkImageExample()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Persistence Examples'),
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