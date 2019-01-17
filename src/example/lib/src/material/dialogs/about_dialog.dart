import 'package:flutter/material.dart';


class MyAboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('About Dialog'),
      onPressed: () async {
        showAboutDialog(
          context: context,
          applicationIcon: Icon(Icons.android),
          applicationLegalese: 'legalese',
          applicationName: 'name',
          applicationVersion: '1.0.0.1',
          children: <Widget>[
            Text('text1'),
            Text('text2')
          ]
        );
      },
    );
  }
}
