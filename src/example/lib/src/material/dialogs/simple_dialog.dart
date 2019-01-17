import 'package:flutter/material.dart';


class MySimpleDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Simple Dialog'),
      onPressed: () {
        var result = showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context)  {
            return SimpleDialog(
              title: Text('Simple Dialog'),
              titlePadding: EdgeInsets.all(5.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
              children: <Widget>[
                Text('text1'),
                Text('text2'),
              ],
            );
          }
        );
      },
    );
  }
}
