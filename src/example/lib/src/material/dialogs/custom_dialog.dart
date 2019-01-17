import 'package:flutter/material.dart';


class MyCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Custom Dialog'),
      onPressed: () {
        var result = showDialog(
            context: context,
            barrierDismissible: true,
            builder: (context) {
              return ToastDialog(msg: 'hello world');
            }
        );
      },
    );
  }
}


class ToastDialog extends Dialog {
  final String msg;
  ToastDialog({Key key, @required this.msg}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.white,
        alignment: Alignment.center,
        child: Text(
          msg,
          style: TextStyle(
            fontSize: 16,
            color: Colors.blue
          ),
        ),
      ),
    );
  }
}