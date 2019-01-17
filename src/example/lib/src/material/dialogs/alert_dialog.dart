import 'package:flutter/material.dart';


class MyAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Alert Dialog'),
      onPressed: () async {
        var result = await showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return  AlertDialog(
                title: Text('title'),
                content: Text('content'),
                actions: <Widget>[
                  RaisedButton(
                    child: Text(
                      'agree',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop('agree');
                    },
                  ),
                  RaisedButton(
                    child: Text(
                      'denied',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop('denied');
                    },
                  ),
                ],
              );
            }
        );
        print(result);
      },
    );
  }
}
